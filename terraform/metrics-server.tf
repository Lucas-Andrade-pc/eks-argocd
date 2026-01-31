resource "helm_release" "metrics-server" {
  name             = "metrics-server"
  repository       = "https://kubernetes-sigs.github.io/metrics-server/"
  chart            = "metrics-server"
  namespace        = "metrics-server"
  create_namespace = true
  version          = "3.13.0"
  values           = [file("values/metrics.yml")]
  depends_on       = [aws_eks_node_group.general]
}