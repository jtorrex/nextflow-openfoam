#!/usr/bin/env nextflow

// Initial section

// This is needed for activating the new DSL2
nextflow.enable.dsl=2

// Inputs section



// Processes section

process listAvailableWorkflows {

    // To execute locally
    // List the files contained in the MinIO bucket with the parameters for the execution?
    // Just print the content of the Nextflow workflow file

    output:
    stdout
        
    script:
    """
    echo "List workflows here"
    """
}

process selectWorkflow {

    // To execute locally
    // Obtain the input parameters from the user with the desired workflow
    // Example: want to run OpenFoam, or Tensorflow, or benchmark

    output:
    stdout
        
    script:
    """
    echo "Select workflows here"
    """
}

process inputParameters {

    // To execute locally
    // Obtain the input parameters from the user with the desired resources that want to use: cpu, mem, priority, etc
    // Define how parameters can be passed to a workflow, how do input files work?
    // IDEA: Parameters stored as variables
    // IDEA: Parameters stored as files, parsing it later

    //input:
    // Parameters file definition, could use --inputfile OTHERFILENAME
    params.inputfile= "$baseDir/data/workflow-parameters-file"


    // the "file method" returns a file system object given a file path string  
    workflow-parameters-file = file(params.inputfile)				
    
    // check if the file exists
    if( !workflow-parameters-file.exist()) exit 1, "Missing parameters file: ${parameters_file}"

        
    script:
    """
    echo "Parse the parameters"
    """
}

process selectPlacementPolicy {

    // To execute locally
    // Query the OKA tool against api to select the best executionn placement

    output:
    stdout
        
    script:
    """
    echo "Input parameters here"
    """
}

process selectPlatform execution {

    // To execute locally
    // Based on the response from OKA
    // A - If HPC. Start the parametrization for the Nextflow files to adjust the launching scripts
    // B - If Cloud. Start the check and infra creation, and later parametrize the launching scripts

    output:
    stdout
        
    script:
    """
    echo "Input parameters here"
    """
}

process runExecution {

    // Should be executed based on the parameters from before
    // Executor should be Slurm + Singularity agains the selected placement resource
    // Run the parametrized Nextflow pipeline:
    //  nextflow run pipelines/[workflowN.nf] --profile [profileN]


}

process reportExecution {
    
    // End of job. Notification is send

}

process downloadOutputMetrics {

    // Accesses and downloads the output and metrics

}

process generateReport {

    // Generate a report for the user with metrics about the execution

}
// Workflows section

/*
 * A workflow consist of a number of invocations of processes
 * where they are fed with the expected input channels
 * as they were cutom functions. You can only invoke a process once per workflow.
 */

/*
 * A workflow can be named as a function and receive an input using the take keyword
 */

workflow dataStagingWorkflow {
    take: str_input

    main:
    inputParameters()

}

workflow infrastructureWorkflow {
}

workflow userWorkflow {
    
}

// Main workflow execution
workflow {
    dataStagingWorkflow()
    infraestructureWorkflow()
    userWorkflow()
}
