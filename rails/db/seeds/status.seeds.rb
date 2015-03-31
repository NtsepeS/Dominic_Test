[
  "Operational",
  "Audit Done",
  "Audit In Progress",
  "Decommissioned",
  "Commissioning",
  "Under Construction",
  "To Be Decommissioned",
  "Waiting for Field Service Engineer Report",
  "Waiting for Field Services QA Approval",
  "Waiting for IS QA Approval",
].each do |status|
  Status.find_or_create_by(name: status)
end