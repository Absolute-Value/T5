# 1ノード8GPU

# Linear
batch_size=400
dataset="all"

epoch=50

enc=2
dec=12
lr=1e-4

torchrun --nnodes=1 --nproc_per_node=8 multi_task_train.py \
        --id tnztdw3c \
        --transformer_num_layers $enc \
        --transformer_num_decoder_layers $dec \
        --stage train \
        --loss CrossEntropy \
        --lr $lr \
        --lr_scheduler LinearWarmup \
        -b $batch_size \
        --start_epoch 2 \
        --num_epochs $epoch \
        --warmup_rate 0.01 \
        --datasets $dataset \
        --root_dir /local/ \
        --uncalc_val \
        --save_interval 1 \
        --result_dir results/train/all/enc$enc\_dec$dec/Linear$epoch\_$lr/