variable "enabled" {
  description = "Flag to enable or disable the sending of emails"
  default     = true
}

variable "from" {
  description = "From address for email"
}

variable "to" {
  description = "Email recipients"
  type        = list(any)
}

variable "subject" {
  description = "Email subject template"
}

variable "body" {
  description = "Email body template"
  sensitive = true
}

variable "username" {
  description = "Username to authenticate with the SMTP server"
  type        = string
}

variable "password" {
  description = "Password to authenticate with the SMTP server"
  type        = string
  sensitive = true
}

variable "host" {
  description = "SMTP Host"
  default     = "smtp.gmail.com"
}

variable "port" {
  description = "SMTP Port"
  default     = "587"
}

variable "vars" {
  description = "Parameters to pass to the body template"
  default     = {}
  sensitive = true
}
