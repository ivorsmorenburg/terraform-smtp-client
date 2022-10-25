data "template_file" "body" {
  template = var.body
  vars     = var.vars
}

data "template_file" "subject" {
  template = var.subject

  vars = var.vars
}

locals {
  body    = sensitive(data.template_file.body.rendered)
  subject = sensitive(data.template_file.subject.rendered
  command = "${var.mail_command} ${join(" ", var.to)}")
}

resource "null_resource" "sent_lock" {
  count = var.enabled == true ? 1 : 0

  provisioner "local-exec" {
    command = local.command

    environment = {
      EMAIL_FROM     = var.from
      EMAIL_SUBJECT  = local.subject
      EMAIL_BODY     = local.body
      EMAIL_PORT     = var.port
      EMAIL_HOST     = var.host
      EMAIL_USERNAME = var.username
      EMAIL_PASSWORD = var.password
    }

    on_failure = fail
  }

  depends_on = [
    data.template_file.body,
    data.template_file.subject
  ]
}
