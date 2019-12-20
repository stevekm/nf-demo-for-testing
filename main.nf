params.outputDir = "output"
params.sampleIDs = 1..10

process foo_task {
    publishDir "${params.outputDir}", mode: 'copy'
    echo true

    input:
    val(x) from Channel.fromList(params.sampleIDs)

    output:
    file("${output_file}")

    script:
    output_file = "${x}.txt"
    """
    echo "${x}"
    touch "${output_file}"
    sleep 15
    """
}
