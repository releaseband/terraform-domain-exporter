# Changelog

## [2.1.2](https://github.com/releaseband/terraform-domain-exporter/compare/v2.1.1...v2.1.2) (2023-09-20)


### Bug Fixes

* **main.tf:** reduce memory request from 128Mi to 30Mi to optimize resource usage ([a890419](https://github.com/releaseband/terraform-domain-exporter/commit/a890419725e1c3f44270c08cc20a810f4b8f87c6))

## [2.1.1](https://github.com/releaseband/terraform-domain-exporter/compare/v2.1.0...v2.1.1) (2023-08-30)


### Bug Fixes

* **main.tf:** reduce CPU request from 5m to 1m to optimize resource usage ([4662ff9](https://github.com/releaseband/terraform-domain-exporter/commit/4662ff99177db40c6777e3da0f8b989219f710fd))

## [2.1.0](https://github.com/releaseband/terraform-domain-exporter/compare/v2.0.0...v2.1.0) (2023-03-14)


### Features

* Add chart_version variable for helm_release resource in main.tf and variables.tf ([c6f1384](https://github.com/releaseband/terraform-domain-exporter/commit/c6f1384957516f835c09ef757a2378f35f6cab9d))
