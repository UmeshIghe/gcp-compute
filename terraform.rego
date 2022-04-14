package terraform
import input.tfplan as tfplan

deny[reason] {
	r = tfplan.resource_changes[_].change.after.confidential_instance_config[_]
	r.enable_confidential_compute == false
	reason := sprintf("%-40s :: enable_confidential_compute value must not be false", 
	                    [r.enable_confidential_compute])
}
