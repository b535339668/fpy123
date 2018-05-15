# 基于密度的聚类分析算法，eps是扫描半径，MinPts是最小包含点数
def dbscan(dataset, eps, MinPts):
    c = 0

    for item in dataset:
        if item.group != "not-visited":
            continue

        item.group = "visited"
        NeighborPts = regionQuery(item, eps, dataset)

        if (len(NeighborPts) < MinPts):
            item.group = "outlier"
        else:
            c = c + 1
            expandCluster(item, NeighborPts, c, eps, MinPts, dataset)

    return c


# 对簇进行扩展
def expandCluster(item, NeighborPts, c, eps, MinPts, dataset):
    item.group = c
    for itens in NeighborPts:
        if itens.group == "not-visited":
            itens.group = "visited"
            NeighborPts_ = regionQuery(itens, eps, dataset)
            if (len(NeighborPts_) >= MinPts):
                NeighborPts.union(NeighborPts_)
            if itens.group != "not-visited":
                itens.group = c