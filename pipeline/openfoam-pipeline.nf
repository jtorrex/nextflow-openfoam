process openFoamShowDir {

    output:
    stdout

    script:
    """
    echo "Enter working directory..."
    cd /data/motorBike
    echo ""
    echo "Listing directory..."
    ls
    echo ""
    """
}

process openFoamSurfaceFeatures {

    output:
    stdout

    script:
    """
    echo "Running OpenFoam: surfaceFeatures"
    surfaceFeatures
    echo ""
    """
}

process openFoamBlockMesh {    

    output:
    stdout
    
    script:
    """
    echo "Running OpenFoam: blockMesh"
    blockMesh
    echo ""
    """
}

process openFoamDecomposePar {

    output:
    stdout
    
    script:
    """
    echo "Running OpenFoam: decomposePar"
    decomposePar -copyZero
    echo ""
    """
}

process openFoamSnappyHexMesh {

    output:
    stdout
    
    script:
    """
    echo "Running OpenFoam: snappyHexMesh"
    snappyHexMesh -overwrite parallel
    echo ""
    """
}
    
process openFoamPotentialFoam {

    output:
    stdout
    
    script:
    """
    echo "Running OpenFoam: potentialFoam"
    potentialFoam -parallel
    echo ""
    """
}

process openFoamSimpleFoam {

    output:
    stdout
    
    script:
    """
    echo "Running OpenFoam: simpleFoam"
    simpleFoam -parallel
    echo ""
    """
}

process openFoamReconstructParMesh {

    output:
    stdout

    script:
    """
    echo "Running OpenFoam: reconstructParMesh"
    reconstructParMesh -constant
    echo ""
    """
}

process openFoamReconstructPar {

    output:
    stdout

    script:
    """
    echo "Running OpenFoam: reconstructPar"
    reconstructPar -latestTime
    """
}

