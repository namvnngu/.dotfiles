env="${1}"
phone="${2}"

usage() {
    echo "Usage: otp <env> <phone>"
    echo "  <env>:   dev, uat"
    echo "  <phone>: phone number"
}

if [[ -z "${env}" || -z "${phone}" ]]; then
    usage
    exit 1
fi

case "${env}" in
    dev)
        account_name="${DEV_AZURE_STORAGE_ACCOUNT}"
        account_key="${DEV_AZURE_STORAGE_ACCESS_KEY}"
        ;;
    uat)
        account_name="${UAT_AZURE_STORAGE_ACCOUNT}"
        account_key="${UAT_AZURE_STORAGE_ACCESS_KEY}"
        ;;
    *)
        echo "Error: unknown environment '${env}'" >&2
        usage
        exit 1
        ;;
esac

if [[ -z "${account_name}" || -z "${account_key}" ]]; then
    echo "Error: Azure storage credentials are not configured for '${env}'." >&2
    exit 1
fi

tmp_file=$(mktemp)
echo "Created a temp file '${tmp_file}'..."
trap "rm -f '${tmp_file}'; echo \"Removed the temp file '${tmp_file}'\"" EXIT

container="sms"
blob_name="${phone}/sms.json"

echo "Downloading '${blob_name}' into '${tmp_file}'..."
az storage blob download \
    --no-progress \
    --account-name "${account_name}" \
    --account-key "${account_key}" \
    --container-name "${container}" \
    --name "${blob_name}" \
    --file "${tmp_file}" \
    --output none
if [[ "$?" != '0' ]]; then
    exit 1
fi

otp="$(
    sed -n 's/.*OTP is: \([0-9][0-9]*\).*/\1/p' "${tmp_file}" |
    head -n 1
)"
printf '%s' "${otp}" | pbcopy
echo "Copied OTP ${otp} to clipboard!"
