## Start a test and skip TEARDOWN steps if it fails
test/e2e/%/debug:
	@make SKIPCLEANUP="-args --fail-fast" $(@D)

## Runs e2e tests
test/e2e:
	./hack/e2e/run_all.sh

## Runs ActiveGate e2e test only
test/e2e/activegate: manifests/crd/helm
	go test -v -tags "$(shell ./hack/build/create_go_build_tags.sh true)" -timeout 20m -count=1 ./test/scenarios/activegate/default $(SKIPCLEANUP)

## Runs ActiveGate proxy e2e test only
test/e2e/activegate/proxy: manifests/crd/helm
	go test -v -tags "$(shell ./hack/build/create_go_build_tags.sh true)" -timeout 20m -count=1 ./test/scenarios/activegate/proxy $(SKIPCLEANUP)

## Runs ClassicFullStack e2e test only
test/e2e/classic: manifests/crd/helm
	go test -v -tags "$(shell ./hack/build/create_go_build_tags.sh true)" -timeout 20m -count=1 ./test/scenarios/classic $(SKIPCLEANUP)

## Runs ClassicFullStack switch mode e2e test only
test/e2e/classic/switchmodes: manifests/crd/helm
	go test -v -tags "$(shell ./hack/build/create_go_build_tags.sh true)" -timeout 20m -count=1 ./test/scenarios/classic/switch_modes $(SKIPCLEANUP)

## Runs CloudNative codemodules e2e test only
test/e2e/cloudnative/codemodules: manifests/crd/helm
	go test -v -tags "$(shell ./hack/build/create_go_build_tags.sh true)" -timeout 20m -count=1 ./test/scenarios/cloudnative/codemodules $(SKIPCLEANUP)

## Runs CloudNative automatic injection disabled e2e test only
test/e2e/cloudnative/disabledautoinjection: manifests/crd/helm
	go test -v -tags "$(shell ./hack/build/create_go_build_tags.sh true)" -timeout 20m -count=1 ./test/scenarios/cloudnative/disabled_auto_injection $(SKIPCLEANUP)

## Runs CloudNative install e2e test only
test/e2e/cloudnative/install: manifests/crd/helm
	go test -v -tags "$(shell ./hack/build/create_go_build_tags.sh true)" -timeout 20m -count=1 ./test/scenarios/cloudnative/default $(SKIPCLEANUP)

## Runs CloudNative istio e2e test only
test/e2e/cloudnative/istio: manifests/crd/helm
	go test -v -tags "$(shell ./hack/build/create_go_build_tags.sh true)" -timeout 20m -count=1 ./test/scenarios/cloudnative/istio $(SKIPCLEANUP)

## Runs CloudNative network problem e2e test only
test/e2e/cloudnative/network: manifests/crd/helm
	go test -v -tags "$(shell ./hack/build/create_go_build_tags.sh true)" -timeout 20m -count=1 ./test/scenarios/cloudnative/network_problems $(SKIPCLEANUP)

## Runs CloudNative proxy e2e test only
test/e2e/cloudnative/proxy: manifests/crd/helm
	go test -v -tags "$(shell ./hack/build/create_go_build_tags.sh true)" -timeout 20m -count=1 ./test/scenarios/cloudnative/proxy $(SKIPCLEANUP)

## Runs public registry test only
test/e2e/cloudnative/publicregistry: manifests/crd/helm
	go test -v -tags "$(shell ./hack/build/create_go_build_tags.sh true)" -timeout 20m -count=1 ./test/scenarios/cloudnative/public_registry $(SKIPCLEANUP)

## Runs Classic/CloudNative mode switching tests
test/e2e/cloudnative/switchmodes: manifests/crd/helm
	go test -v -tags "$(shell ./hack/build/create_go_build_tags.sh true)" -timeout 30m -count=1 ./test/scenarios/cloudnative/switch_modes $(SKIPCLEANUP)

## Runs CloudNative upgrade e2e test only
test/e2e/cloudnative/upgrade: manifests/crd/helm
	go test -v -tags "$(shell ./hack/build/create_go_build_tags.sh true)" -timeout 20m -count=1 ./test/scenarios/cloudnative/upgrade $(SKIPCLEANUP)

## Runs CloudNative upgrade e2e test only
test/e2e/cloudnative/networkzones: manifests/crd/helm
	go test -v -tags "$(shell ./hack/build/create_go_build_tags.sh true)" -timeout 20m -count=1 ./test/scenarios/cloudnative/network_zones $(SKIPCLEANUP)

## Runs Application Monitoring dataingest e2e test only
test/e2e/applicationmonitoring/dataingest: manifests/crd/helm
	go test -v -tags "$(shell ./hack/build/create_go_build_tags.sh true)"  -count=1 ./test/scenarios/applicationmonitoring  -run ^TestDataIngest$  $(SKIPCLEANUP)

## Runs Application Monitoring label versio detection e2e test only
test/e2e/applicationmonitoring/labelversion: manifests/crd/helm
	go test -v -tags "$(shell ./hack/build/create_go_build_tags.sh true)"  -count=1 ./test/scenarios/applicationmonitoring  -run ^TestLabelVersionDetection$  $(SKIPCLEANUP)

## Runs Application Monitoring readonly csi-volume e2e test only
test/e2e/applicationmonitoring/readonlycsivolume: manifests/crd/helm
	go test -v -tags "$(shell ./hack/build/create_go_build_tags.sh true)"  -count=1 ./test/scenarios/applicationmonitoring  -run ^TestReadOnlyCSIVolume$  $(SKIPCLEANUP)

## Runs Application Monitoring without CSI e2e test only
test/e2e/applicationmonitoring/withoutcsi: manifests/crd/helm
	go test -v -tags "$(shell ./hack/build/create_go_build_tags.sh true)"  -count=1 ./test/scenarios/applicationmonitoring  -run ^TestAppOnlyWithoutCSI$  $(SKIPCLEANUP)

## Runs SupportArchive e2e test only
test/e2e/supportarchive: manifests/crd/helm
	go test -v -tags "$(shell ./hack/build/create_go_build_tags.sh true)" -count=1 ./test/scenarios/support_archive $(SKIPCLEANUP)

## Runs e2e tests on gke-autopilot
test/e2e/gke-autopilot: manifests/kubernetes/gke-autopilot
	go test -v -tags "$(shell ./hack/build/create_go_build_tags.sh true)" -timeout 30m -count=1 ./test/scenarios/applicationmonitoring $(SKIPCLEANUP)

## Runs Application Monitoring dataingest e2e test only on gke-autopilot
test/e2e/gke-autopilot/applicationmonitoring/dataingest: manifests/kubernetes/gke-autopilot
	go test -v -tags "$(shell ./hack/build/create_go_build_tags.sh true)" -count=1 ./test/scenarios/applicationmonitoring  -run ^TestDataIngest$  $(SKIPCLEANUP)

## Runs Application Monitoring label versio detection e2e test only on gke-autopilot
test/e2e/gke-autopilot/applicationmonitoring/labelversion: manifests/kubernetes/gke-autopilot
	go test -v -tags "$(shell ./hack/build/create_go_build_tags.sh true)" -timeout 25m -count=1 ./test/scenarios/applicationmonitoring  -run ^TestLabelVersionDetection$  $(SKIPCLEANUP)

## Runs Application Monitoring readonly csi-volume e2e test only on gke-autopilot
test/e2e/gke-autopilot/applicationmonitoring/readonlycsivolume: manifests/kubernetes/gke-autopilot
	go test -v -tags "$(shell ./hack/build/create_go_build_tags.sh true)" -timeout 20m -count=1 ./test/scenarios/applicationmonitoring  -run ^TestReadOnlyCSIVolume$  $(SKIPCLEANUP)

## Runs Application Monitoring without CSI e2e test only on gke-autopilot
test/e2e/gke-autopilot/applicationmonitoring/withoutcsi: manifests/kubernetes/gke-autopilot
	go test -v -tags "$(shell ./hack/build/create_go_build_tags.sh true)" -timeout 20m -count=1 ./test/scenarios/applicationmonitoring  -run ^TestAppOnlyWithoutCSI$  $(SKIPCLEANUP)

## Run EdgeConnect e2e test only
test/e2e/edgeconnect: manifests/crd/helm
	go test -v -tags "$(shell ./hack/build/create_go_build_tags.sh true)" -count=1 ./test/scenarios/edgeconnect $(SKIPCLEANUP)
