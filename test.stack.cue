package main

import (
	"stakpak.dev/devx/v1"
	"stakpak.dev/devx/v1/traits"
)

stack: v1.#Stack & {
	components: {
		cluster: {
            traits.#KubernetesCluster
            k8s: {
                version: {
                    minor: 28
                }
                name: "fwdemo"
				}
	}
	}

}
