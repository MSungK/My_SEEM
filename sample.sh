#!/usr/bin/zsh


export DETECTRON2_DATASETS=xdecoder_data
export DATASET=xdecoder_data
export DATASET2=xdecoder_data
export VLDATASET=xdecoder_data
export PATH=$PATH:xdecoder_data/coco_caption/jre1.8.0_321/bin
export PYTHONPATH=$PYTHONPATH:xdecoder_data/coco_caption


python entry.py train \
    --conf_files configs/seem/focalt_unicl_lang_v1.yaml \
    --overrides \
    FP16 True \
    COCO.INPUT.IMAGE_SIZE 1024 \
    MODEL.DECODER.HIDDEN_DIM 512 \
    MODEL.ENCODER.CONVS_DIM 512 \
    MODEL.ENCODER.MASK_DIM 512 \
    TEST.BATCH_SIZE_TOTAL 1 \
    TRAIN.BATCH_SIZE_TOTAL 1 \
    TRAIN.BATCH_SIZE_PER_GPU 1 \
    SOLVER.MAX_NUM_EPOCHS 50 \
    SOLVER.BASE_LR 0.0001 \
    SOLVER.FIX_PARAM.backbone True \
    SOLVER.FIX_PARAM.lang_encoder True \
    SOLVER.FIX_PARAM.pixel_decoder True \
    MODEL.DECODER.COST_SPATIAL.CLASS_WEIGHT 5.0 \
    MODEL.DECODER.COST_SPATIAL.MASK_WEIGHT 2.0 \
    MODEL.DECODER.COST_SPATIAL.DICE_WEIGHT 2.0 \
    MODEL.DECODER.TOP_SPATIAL_LAYERS 10 \
    MODEL.DECODER.SPATIAL.ENABLED True \
    MODEL.DECODER.GROUNDING.ENABLED True \
    FIND_UNUSED_PARAMETERS True \
    ATTENTION_ARCH.SPATIAL_MEMORIES 32 \
    MODEL.DECODER.SPATIAL.MAX_ITER 5 \
    ATTENTION_ARCH.QUERY_NUMBER 3 \
    STROKE_SAMPLER.MAX_CANDIDATE 10 \
    WEIGHT True \
    RESUME_FROM xdecoder_focalt_last.pt