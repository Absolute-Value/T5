# 1ノード8GPU

batch_size=36
dataset="cc3m cc12m imagenet imagenet21k places365 redcaps sun397"

epoch=2

enc=2
dec=12

TORCH_DISTRIBUTED_DEBUG=DETAIL torch.distributed.launch --nnodes=1 --nproc_per_node=4 train_use_testdata.py \
        --transformer_num_layers $enc \
        --transformer_num_decoder_layers $dec \
        --phase pretrain \
        --loss CrossEntropy \
        --lr 1e-4 \
        --lr_scheduler LinearWarmup \
        -b $batch_size \
        --num_epochs $epoch \
        --warmup_rate 0.001 \
        --datasets $dataset \
        --root_dir /local/ \
        --save_interval 1 \
        --result_dir results/pretrain/cc3m_cc12m_imagenet_imagenet21k_places365_redcaps_sun397/enc$enc\_dec$dec/Linear$epoch/ \
        --root_dir /home/omote/gpu-node-data01 \
