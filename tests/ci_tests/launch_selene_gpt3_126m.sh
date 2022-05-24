HYDRA_FULL_ERROR=1 python3 main.py \
    +ci_test=True \
    training=gpt3/126m \
    run_data_preparation=False \
    run_training=True \
    run_conversion=False \
    run_finetuning=False \
    run_evaluation=False \
    bignlp_path=${GIT_CLONE_PATH} \
    data_dir=/lustre/fsw/joc/yuya/bignlp/bignlp-scripts_ci/data \
    base_results_dir=${RESULTS_DIR} \
    "container='${BUILD_IMAGE_NAME_SRUN}'" \
    cluster.partition=luna \
    cluster.account=joc \
    cluster.gpus_per_task=null \
    cluster.job_name_prefix="joc-bignlp_ci:" \
    training.run.name=ci_gpt3_126m_deterministic \
    training.run.time_limit="30:00" \
    training.trainer.num_nodes=${NUM_NODES} \
    training.trainer.max_steps=50 \
    training.trainer.log_every_n_steps=1 \
    training.trainer.val_check_interval=10 \
    training.trainer.limit_val_batches=10 \
    training.model.data.data_prefix=[1.0,/lustre/fsw/joc/yuya/bignlp/bignlp-scripts_ci/data/my-gpt3_00_text_document]
