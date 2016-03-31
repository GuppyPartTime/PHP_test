echo "Development Environment Prepared..."

GUPPY_HOST='192.168.56.102 local.guppy.com.tr www.local.guppy.com.tr'
FILE='/etc/hosts'

#grep -q "$GUPPY_HOST" "$FILE" || echo "$GUPPY_HOST" >> "$FILE"

echo "Finish..."
