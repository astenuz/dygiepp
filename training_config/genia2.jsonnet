local template = import "template.libsonnet";

template.DyGIE {
  bert_model: "microsoft/BiomedNLP-PubMedBERT-base-uncased-abstract",
  cuda_device: 0,
  data_paths: {
    train: "data/genia2/train_sample.json",
    validation: "data/genia2/dev_sample.json",
    test: "data/genia2/test_sample.json",
  },
  loss_weights: {
    ner: 1.0,
    relation: 0.0,
    coref: 1.0,
    events: 0.0
  },
  model +: {
    modules +: {
      coref +: {
        coref_prop: 2
      }
    }
  },
  target_task: "ner",
  trainer +: {
    num_epochs: 3
  },
}
