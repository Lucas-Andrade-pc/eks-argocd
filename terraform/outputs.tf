output "name" {
  value = aws_vpc.main.id
}
output "subnets_private_zone" {
  value = aws_subnet.private_zone.*.id
}
output "subnets_public_zone" {
  value = aws_subnet.public_zone.*.id
}
output "role_eks_arn" {
  value = aws_iam_role.eks.arn
}
output "role_eks_name" {
  value = aws_iam_role.eks.name
}
output "id_eks" {
  value     = aws_eks_cluster.eks.id
  sensitive = true
}
output "name_eks" {
  value     = aws_eks_cluster.eks.*.name
  sensitive = true
}
output "endpoint_eks" {
  value     = aws_eks_cluster.eks.*.name
  sensitive = true
}
output "id_role_node_group_arn" {
  value = aws_iam_role.nodes.arn
}
output "id_role_node_group_id" {
  value = aws_iam_role.nodes.id
}
output "eks_node_group_id" {
  value = aws_eks_node_group.general.id
}
output "aws_eks_addon_id" {
  value = aws_eks_addon.pod_identity.id
}
output "aws_eks_addon_name" {
  value = aws_eks_addon.pod_identity.addon_name
}