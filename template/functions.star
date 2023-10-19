load("@ytt:struct", "struct")
def getLabels(values):
    return {
        "app.kubernetes.io/name": values.name,
        "app.kubernetes.io/version": values.version,
        "provider": values.provider
        }
end

def getVolumes(values):
    volumes = []
    for configMap in values.configMaps:
        volumes.append({
            "name": configMap.name,
              "configMap": {
                "name": configMap.name
                }
        })
    end
    return volumes
end

def getVolumeMounts(values):
    volumeMounts = []
    for configMap in values.configMaps:
        volumeMounts.append({
            "name": configMap.name,
            "mountPath": configMap.mountPath
        })
    end
    return volumeMounts
end

f = struct.make(getLabels=getLabels, getVolumes=getVolumes, getVolumeMounts=getVolumeMounts)