# Monitoring

## Stack
Monitoring is done via kube-prometheus-stack installed via Helm chart. 

## Fortigate
Some of the probes are disabled due to missing endpoints (probably related FortiOS version or Fortigate model). Not all of probe's names are present in docs and not all of names are written correctly. Real probe's names are to be found here: https://github.com/prometheus-community/fortigate_exporter/blob/main/pkg/probe/probe.go

