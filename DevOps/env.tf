variable "redis_password" {
  description = "Value of the password for the Redis container"
  type        = string
  default     = "redis"
}

variable "postgres_user" {
  description = "Value of the user for the Postgres container"
  type        = string
  default     = "postgres"
}

variable "postgres_password" {
  description = "Value of the password for the Postgres container"
  type        = string
  default     = "postgres"
}
