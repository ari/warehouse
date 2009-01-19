module Repository::SvnMethods
  def revisions_to_sync
    @revisions_to_sync ||= begin
      ((synced_revision.to_i + 1)..latest_revision.to_i).to_a
    end
  end

  def sync_progress
    return 0 if synced_revision.blank?
    ((synced_revision.to_f / latest_revision.to_f) * 100).floor
  end
end