# Deployment and Model Tuning in Vertex AI Studio

## Overview

This section covers the second half of the prompt-to-production lifecycle:

```text
Build and test
    ↓
Integrate and deploy
    ↓
Monitor and optimize
```

After designing, evaluating, and managing prompts, the next step is to deploy them into applications or integrate them with existing systems.

---

## Prompt-to-Production Lifecycle

The complete lifecycle looks like this:

```text
Design prompt
    ↓
Evaluate output
    ↓
Refine prompt
    ↓
Build and test application
    ↓
Deploy application
    ↓
Monitor and optimize
```

The first half focuses on prompt engineering.  
The second half focuses on integration, deployment, monitoring, and optimization.

---

## Deploying Prompts to Applications

Vertex AI Studio allows users to quickly turn prompts into applications.

Useful options include:

- Build with Code
- Deploy as App
- SDKs
- APIs
- Cloud Run
- Cloud Shell

This helps move from a prompt prototype to a working application.

---

## Build with Code

The **Build with Code** option automatically generates code for the prompt and its parameters.

This is useful when users want to:

- Customize the application
- Reuse the prompt in another app
- Integrate AI features into existing systems
- Move from prototype to production

Simple meaning:

> Build with Code converts the prompt setup into usable application code.

---

## Ways to Access AI Models

Vertex AI Studio supports different levels of access.

| Method | Type | Best For |
|---|---|---|
| Vertex AI Studio UI | No-code | Testing and exploring prompts |
| SDKs | Low-code / code-based | Building applications with Python |
| APIs with cURL | Low-code | Calling models from apps or scripts |

---

## Application Deployment

Google Cloud provides tools to simplify deployment.

### Cloud Run

Cloud Run is used to deploy and run applications without managing servers.

Useful for:

- Web applications
- APIs
- AI-powered apps
- Scalable services

### Cloud Shell

Cloud Shell provides a browser-based command-line environment.

Useful for:

- Running commands
- Testing generated code
- Managing Google Cloud resources
- Deploying applications

---

## Monitoring and Optimization

After deployment, the application and model should be monitored regularly.

Monitoring helps check:

- Model performance
- Output quality
- Response accuracy
- Latency
- Cost
- User experience
- Whether responses are current and reliable

Optimization is needed to improve the application over time.

---

## Grounding

Grounding connects a generative AI model to trusted external data sources.

This helps the model produce answers that are:

- More accurate
- More current
- More reliable
- Better aligned with business data

Simple meaning:

> Grounding helps the model verify its answers using trusted information instead of relying only on training data.

---

## Why Grounding Is Needed

Generative AI models are pre-trained on large datasets.

This means they may sometimes:

- Use outdated information
- Produce inaccurate answers
- Miss company-specific knowledge
- Give generic responses
- Lack access to real-time facts

Grounding helps reduce these issues by connecting the model to current or trusted data.

---

## Retrieval-Augmented Generation

Retrieval-Augmented Generation, or RAG, is a method used to implement grounding.

Simple meaning:

> Grounding is the idea. RAG is one way to do it.

RAG works by retrieving relevant information from a trusted source and then using that information to generate a better answer.

---

## Grounding vs RAG

| Concept | Meaning |
|---|---|
| Grounding | Connecting model responses to trusted data |
| RAG | A method for retrieving relevant data and using it in generation |

---

## Grounding Options in Vertex AI Studio

When building prompts in Vertex AI Studio, grounding can be done using:

- Google real-time search
- Organization or company data
- Field-specific data sources
- Trusted internal documents

This helps the model answer using the latest or most relevant information.

---

## Model Tuning

Model tuning improves the quality of content generation by training the model on task-specific examples.

It is useful when the base model does not perform well enough for a specific business need.

Simple meaning:

> Model tuning customizes a model so it performs better for a specific task or domain.

---

## Grounding vs Model Tuning

| Grounding | Model Tuning |
|---|---|
| Adds external, current information | Trains the model on specific examples |
| Does not change the model itself | Changes or adapts model behavior |
| Useful for latest facts and company data | Useful for improving task-specific performance |
| Example: checking latest policy data | Example: teaching model a specific classification style |

---

## Fine-Tuning Analogy

Foundation model:

```text
K-12 education
```

Fine-tuning:

```text
Specialized professional training, like medical school
```

Grounding:

```text
Checking the latest research, rules, policies, or updates before answering
```

This means fine-tuning builds deeper domain skill, while grounding keeps answers updated with trusted information.

---

## Ways to Customize a Gen AI Model

There are different levels of customization.

| Method | Technical Level | What It Does |
|---|---|---|
| Prompt design | Low | Guides the model using instructions and examples |
| Parameter-efficient tuning | Medium | Updates a small part of the model |
| Full fine-tuning | High | Updates all model parameters |

---

## Prompt Design

Prompt design uses natural language instructions and examples to guide the model.

It does not change the model’s parameters.

Benefits:

- Easy to start
- No coding required
- Fast experimentation
- Lower cost
- Useful for many business users

Limitations:

- May not be enough for highly specialized tasks
- Output quality depends heavily on prompt quality
- Does not deeply change model behavior

---

## Parameter-Efficient Tuning

Parameter-efficient tuning is also called adapter tuning.

It updates only a small subset of the model’s parameters.

Useful when:

- The task is specialized
- Full fine-tuning is not required
- Compute resources need to be controlled
- Faster tuning is preferred

Simple meaning:

> Parameter-efficient tuning adapts a large model by changing only a small part of it.

---

## Full Fine-Tuning

Full fine-tuning updates all model parameters.

It is useful for highly complex tasks where very high-quality results are needed.

Benefits:

- Can produce better results for complex tasks
- Stronger task-specific customization

Limitations:

- Requires more compute
- Higher cost
- More technical effort
- More resources needed for tuning and serving

---

## Supervised Fine-Tuning

Vertex AI supports supervised fine-tuning for customizing foundation models.

Supervised fine-tuning uses labeled examples to teach the model a desired behavior.

Each example contains:

- Input text: the prompt
- Output text: the expected response

Simple meaning:

> Supervised fine-tuning teaches a model using examples of the correct input and output.

---

## When to Use Supervised Fine-Tuning

Supervised fine-tuning is useful for well-defined tasks with available labeled data.

Good use cases:

- Classification
- Summarization
- Extraction
- Chat tasks
- Sentiment analysis
- Domain-specific response generation

---

## Tuning Dataset Format

The tuning dataset should be structured as a JSONL file.

Each row contains a training example.

Basic structure:

```json
{"input_text": "This commercial building is architecturally interesting and has a great interior layout.", "output_text": "positive"}
{"input_text": "The room was terrible. It needs major rework.", "output_text": "negative"}
```

Each record includes:

- Prompt or input text
- Expected output text

This helps the model learn the desired behavior.

---

## Example: Sentiment Classification

Input:

```text
This commercial building is architecturally interesting and has a great interior layout.
```

Expected output:

```text
positive
```

Input:

```text
The room was terrible. It needs major rework.
```

Expected output:

```text
negative
```

This teaches the model how to classify sentiment correctly.

---

## Starting a Tuning Job in Vertex AI Studio

Basic steps:

1. Open Vertex AI Studio.
2. Go to the Tuning menu.
3. Select Create a Tuned Model.
4. Add model details.
5. Provide the tuning dataset.
6. Start the tuning job.
7. Monitor the tuning status in Google Cloud Console.
8. Find the tuned model in Vertex AI Model Registry.
9. Deploy it to an endpoint or test it in Vertex AI Studio.

---

## Vertex AI Model Registry

After the tuning job is complete, the tuned model appears in Vertex AI Model Registry.

From there, the model can be:

- Tested
- Managed
- Deployed to an endpoint
- Used for serving predictions

---

## Key Takeaways

- Deployment is the second half of the prompt-to-production lifecycle.
- Vertex AI Studio can generate code from prompts using Build with Code.
- Prompts can be deployed as applications using Deploy as App.
- SDKs and APIs allow AI features to be integrated into custom applications.
- Cloud Run and Cloud Shell help with deployment and production workflows.
- Monitoring is important after deployment to maintain quality and performance.
- Grounding connects model responses to trusted and current data sources.
- RAG is a method used to implement grounding.
- Model tuning improves a model for specific tasks using training examples.
- Prompt design does not change model parameters.
- Parameter-efficient tuning updates a small subset of parameters.
- Full fine-tuning updates all model parameters and requires more resources.
- Supervised fine-tuning uses labeled examples to teach desired behavior.
- Tuned models can be deployed through Vertex AI Model Registry.

---