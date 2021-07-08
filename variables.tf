variable "table_name" {
  description = "The name of the DynamoDB table to add auto-scaling to"
  type        = string
}

variable "read_min_capacity" {
  description = "The minimum READ capacity for the table"
  type        = number
  default     = 1
}

variable "read_max_capacity" {
  description = "The maximum READ capacity for the table"
  type        = number
  default     = 50
}

variable "read_target_value" {
  description = "The target utilization percentage for the table"
  type        = number
  default     = 85
}

variable "read_scale_in_cooldown" {
  description = "The number of seconds before scaling IN can occur after a scaling action"
  type        = number
  default     = 300
}

variable "read_scale_out_cooldown" {
  description = "The number of seconds before scaling OUT can occur after a scaling action"
  type        = number
  default     = 30
}

variable "write_min_capacity" {
  description = "The minimum WRITE capacity for the table"
  type        = number
  default     = 1
}

variable "write_max_capacity" {
  description = "The maximum WRITE capacity for the table"
  type        = number
  default     = 50
}

variable "write_target_value" {
  description = "The target utilization percentage for the table"
  type        = number
  default     = 85
}

variable "write_scale_in_cooldown" {
  description = "The number of seconds before scaling IN can occur after a scaling action"
  type        = number
  default     = 300
}

variable "write_scale_out_cooldown" {
  description = "The number of seconds before scaling OUT can occur after a scaling action"
  type        = number
  default     = 30
}
