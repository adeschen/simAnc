#' @title simuleBasicGenoChr
#'
#' @description
#'
#' @param fileList a \code{list} of \code{GRanges}, the segments from multiple
#' files.
#'
#' @param snv a \code{data.frame}
#'
#' @param genotype \code{data.frame}
#'
#' @return a \code{}
#'
#' @examples
#'
#' # TODO
#'
#' @author Pascal Belleau, Astrid Deschenes
#' @keywords internal


simuleBasicGenoChr <- function(genotype,
                       infoSNV,
                       bedRead,
                       mysegs,
                       nbSim,
                       minCov = 10,
                       seqError =  0.001/3,
                       dProp = NA){

    #infoSNV$snv$gtype <- genotype[infoSNV$listPos,]
    infoSNV$snv <- setGeno(infoSNV, genotype)
    infoSNV$snv <- parseSegLap(mysegs, infoSNV$snv, seqError, dProp)

    resSim <- simulateAllele(infoSNV$snv, minCov, nbSim)

    blockSeg <- simulateBlockSeg(infoSNV$snv[resSim$listSNV, ], nbSim)

    matGeno <- genoMatrix( infoSNV$snv, resSim, blockSeg)

    resFinal <- list(snv = infoSNV$snv,
                     listKeep = infoSNV$listPos[resSim$listKeep],
                     matSim = resSim$matSim,
                     blockSeg = blockSeg,
                     matGeno = matGeno)

    return(resFinal)
}
