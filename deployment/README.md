# Deployment

## Requirements

Para deployar está aplicação é necessário:

> O usuário deve esta logado na conta AWS desejada

1. [Terraform 0.14 ou higher](https://www.terraform.io/downloads) 
2. [TerraGrunt](https://terragrunt.gruntwork.io/docs/getting-started/install)
3. [TFEnv](https://github.com/tfutils/tfenv)

## Good to have

1. Linux / MacOS

## Estrutura do Projeto

```bash
├── README.md
├── USAGE.md
├── app
│   ├── README.md
│   ├── artifacts
│   │   ├── lambda
│   │   │   └── sns_slack.py
│   ├── lambda_slack_func.tf
│   ├── locals.tf
│   ├── modules
│   │   └── lambda
│   │       ├── data.tf
│   │       ├── iam.tf
│   │       ├── locals.tf
│   │       ├── main.tf
│   │       ├── outputs.tf
│   │       ├── variables.tf
│   │       └── versions.tf
│   ├── outputs.tf
│   ├── providers.tf
│   ├── sns.tf
│   ├── variables.tf
│   └── versions.tf
├── deployment
│   ├── README.md
│   ├── terragrunt.hcl
│   ├── us-east-1
│   │   ├── region.hcl
│   │   └── sandbox
│   │       ├── environment.hcl
│   │       └── sre
│   │           └── lambda-sns-slack
│   │               └── terragrunt.hcl
│   └── us-east-2
│       ├── production
│       │   ├── environment.hcl
│       │   └── sre
│       │       └── lambda-sns-slack
│       │           └── terragrunt.hcl
│       └── region.hcl
└── images
    ├── Screen_Shot_01.png
    ├── Screen_Shot_02.png
    ├── Screen_Shot_03.png
    └── Screen_Shot_04.png
```

## Diretório App

Contém a estrutura do código `Terraform` IaC, com os providers, modules, dependências, etc. 

```bash
├── app
    ├── README.md
    ├── artifacts
    │   ├── lambda
    │   │   └── sns_slack.py
    ├── lambda_slack_func.tf
    ├── locals.tf
    ├── modules
    │   └── lambda
    │       ├── data.tf
    │       ├── iam.tf
    │       ├── locals.tf
    │       ├── main.tf
    │       ├── outputs.tf
    │       ├── variables.tf
    │       └── versions.tf
    ├── outputs.tf
    ├── providers.tf
    ├── sns.tf
    ├── variables.tf
    └── versions.tf
```

## Diretório Deployment

Contém a estrutura de deployment do código IaC com as configurações do `TerraGrunt` para executar os deployments.

```bash
├── deployment
    ├── README.md
    ├── terragrunt.hcl
    ├── us-east-1
    │   ├── region.hcl
    │   └── sandbox
    │       ├── environment.hcl
    │       └── sre
    │           └── lambda-sns-slack
    │               └── terragrunt.hcl
    └── us-east-2
        ├── production
        │   ├── environment.hcl
        │   └── sre
        │       └── lambda-sns-slack
        │           └── terragrunt.hcl
        └── region.hcl
```

## Deployando a Aplicação

Vá até a pasta de deployment que está organizada `região/ambiente/time/aplicação`.
Execute o commando `terragrunt`:

### TerraGrunt Init

```bash
terragrunt init
```

### TerraGrunt Plan

```bash
terragrunt plan
```

### TerraGrunt Apply

#### Lembrando que este comando irá solicitar confirmação na execução:

```bash
terragrunt apply
```

#### Lembrando que este comando não solicita confirmação na execução:

```bash
terragrunt apply -auto-approve
```

### Todos os comandos juntos


```bash
terragrunt init
terragrunt plan
terragrunt apply -auto-approve
```
