# Create backup directory based on timestampe
TIMESTAMP_DIR=$(date +%Y-%m-%d_%H-%M-%S)

# Set backup dir
BACKUP_DIR="$DIR/.dotfiles-backup/$TIMESTAMP_DIR"

# Make backup folder if none exists
mkdir -p $BACKUP_DIR

# Sync dotfiles to $HOME directory via rsync and backup
echo "Syncing dotfiles to $HOME and backing up to $BACKUP_DIR"

rsync -avz --backup --backup-dir="$BACKUP_DIR/" "$DIR/dotfiles/" "$HOME/"
