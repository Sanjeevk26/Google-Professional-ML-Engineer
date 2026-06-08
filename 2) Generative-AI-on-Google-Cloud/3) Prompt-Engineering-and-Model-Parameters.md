# Prompt Engineering in Vertex AI Studio

## Overview

Prompt engineering is the process of designing, testing, evaluating, and refining prompts so that a generative AI model produces useful and high-quality outputs.

A good prompt should focus on:

- Content: instructions, context, and examples
- Structure: order, labels, and delimiters

---

## Vertex AI Studio for Prompt Engineering

Vertex AI Studio is used as a workspace for creating and testing prompts.

It allows users to:

- Add system instructions
- Write prompts
- Use Gemini to help draft prompts
- Add examples for better output
- Use multimodal inputs
- Compare prompt outputs
- Manage prompt versions
- Prepare prompts for production use

---

## Prompt Inputs

Vertex AI Studio supports different input types, including:

- Text
- Documents
- Images
- Videos
- Google Cloud Storage files
- Google Drive files
- Local files
- URLs
- YouTube video links

This is useful for building prompts that use real business data and multimodal content.

---

## Prompt Templates

Prompt templates allow prompts to be reused with replaceable variables.

Simple meaning:

> A prompt template works like a function, but in natural language.

Example:

```text
Research {location} tenant vacancy rate and generate a {report_type}.
```

The variables can be changed depending on the task.

Example values:

```text
location = Los Angeles
report_type = real estate market analysis
```

Another example:

```text
location = Los Angeles
report_type = insurance risk assessment
```

Prompt templates are useful for repetitive tasks where the same structure is used with different inputs.

---

## Model Selection

Vertex AI Studio provides access to Google and third-party models.

Examples of model options:

- Gemini
- Anthropic Claude
- Meta Llama
- OpenAI GPT

Google model examples:

| Model | Use Case |
|---|---|
| Gemini Flash | Fast, low-latency tasks |
| Gemini Pro | Complex reasoning and advanced tasks |
| Imagen | Image generation |
| Chirp | Voice generation |
| Veo | Video generation |
| Lyria | Music generation |

The right model depends on the task, output type, speed requirement, and complexity.

---

## Model Parameters

Model parameters control how the model generates responses.

Important parameters:

- Temperature
- Top K
- Top P

These settings control the balance between predictable and creative outputs.

---
## Model Parameters with Examples

Model parameters control how predictable, creative, or varied the model output will be.

The three important parameters are:

- Temperature
- Top K
- Top P

---

## Temperature

Temperature controls the randomness or creativity of the model response.

### Low Temperature

A low temperature makes the model more focused, predictable, and consistent.

Best for:

- Summarization
- Question answering
- Business reports
- Factual responses
- Structured analysis

Example prompt:

```text
Summarize this insurance risk report in 5 bullet points.
```

Expected output with low temperature:

```text
- The report identifies wildfire risk as the highest concern.
- Flood risk is moderate in coastal areas.
- Older properties have higher repair-cost exposure.
- Preventive inspections can reduce claim risk.
- The company should prioritize high-risk ZIP codes.
```

This type of output is direct, stable, and less creative.

---

### High Temperature

A high temperature makes the model more creative, varied, and less predictable.

Best for:

- Brainstorming
- Marketing ideas
- Creative writing
- Campaign slogans
- Story generation

Example prompt:

```text
Create 5 creative campaign taglines for a home insurance company.
```

Expected output with high temperature:

```text
- Protect Your Home Before the Storm Knows Your Name
- Where Safety Meets Peace of Mind
- Your Roof, Your Rules, Our Protection
- Because Every Home Has a Story Worth Protecting
- Insurance That Stands Guard While You Sleep
```

This type of output is more creative and varied.

---

## Top K

Top K limits the model to choosing from the top K most likely next words.

Simple meaning:

> Top K controls how many likely word options the model can choose from.

Example sentence:

```text
The garden was full of beautiful _____.
```

Assume the model predicts these next-word probabilities:

| Word | Probability |
|---|---|
| flowers | 60% |
| trees | 20% |
| herbs | 10% |
| insects | 5% |
| books | 5% |

---

### Low Top K Example

If `Top K = 1`, the model only chooses the most likely word.

Output:

```text
The garden was full of beautiful flowers.
```

This is very predictable.

---

### Higher Top K Example

If `Top K = 3`, the model can choose from the top 3 words:

- flowers
- trees
- herbs

Possible outputs:

```text
The garden was full of beautiful flowers.
```

```text
The garden was full of beautiful trees.
```

```text
The garden was full of beautiful herbs.
```

This gives more variety while still keeping the output relevant.

---

### Too High Top K Risk

If Top K is too high, the model may include less suitable options.

Possible weak output:

```text
The garden was full of beautiful books.
```

This may sound strange because `books` is not a natural fit for the sentence.

---

## Top P

Top P selects words from the smallest group of options whose total probability reaches a defined threshold.

Simple meaning:

> Top P controls word selection based on cumulative probability instead of a fixed number of words.

Example sentence:

```text
The garden was full of beautiful _____.
```

Assume the model predicts:

| Word | Probability |
|---|---|
| flowers | 60% |
| trees | 20% |
| herbs | 10% |
| insects | 5% |
| books | 5% |

---

### Top P Example

If `Top P = 0.80`, the model selects from the smallest group of words that together reach at least 80% probability.

Selected words:

| Word | Probability |
|---|---|
| flowers | 60% |
| trees | 20% |

Total probability:

```text
60% + 20% = 80%
```

Possible outputs:

```text
The garden was full of beautiful flowers.
```

```text
The garden was full of beautiful trees.
```

---

### Higher Top P Example

If `Top P = 0.90`, the model can select from words that together reach at least 90% probability.

Selected words:

| Word | Probability |
|---|---|
| flowers | 60% |
| trees | 20% |
| herbs | 10% |

Total probability:

```text
60% + 20% + 10% = 90%
```

Possible outputs:

```text
The garden was full of beautiful flowers.
```

```text
The garden was full of beautiful trees.
```

```text
The garden was full of beautiful herbs.
```

This allows more variety than `Top P = 0.80`.

---

## Temperature vs Top K vs Top P

| Parameter | What It Controls | Low Value | High Value |
|---|---|---|---|
| Temperature | Randomness and creativity | More predictable and factual | More creative and varied |
| Top K | Number of top word choices | Fewer word choices | More word choices |
| Top P | Probability range for word choices | Smaller, safer word set | Larger, more flexible word set |

---

## Evaluation and Refinement

After writing a prompt and selecting model settings, the next step is to evaluate the output.

Vertex AI Studio supports side-by-side prompt comparison.

This helps compare:

- Different prompts
- Different models
- Different parameter settings
- Different response quality

---

## Ground Truth Evaluation

Ground truth means the preferred or correct answer used to evaluate model responses.

It can come from:

- Field knowledge
- Business rules
- Expert-created answers
- Labeled examples

This helps measure whether the model output is accurate and useful.

---

## Prompt Management

Prompt management is used to save, share, compare, and control prompts.

It supports:

- Prompt storage
- Prompt comparison
- Prompt optimization
- Prompt evaluation
- Version control
- Security
- Collaboration

Simple meaning:

> Prompt management helps organize prompts for future use and production workflows.

---

## Colab Enterprise for Prompt Optimization

Prompts can be improved further in Colab Enterprise notebooks.

This can be done by adding labeled examples and refining outputs.

Useful for:

- More advanced prompt testing
- Prompt optimization
- Working with custom examples
- Improving model response quality

---

## Use Cases for Prompt Engineering

Prompt engineering in Vertex AI Studio can be used for:

- Text generation
- Real-time streaming
- Multimedia generation
- Translation
- Speech-to-text
- Text-to-speech
- Document analysis
- Business reporting
- Risk assessment
- Content creation

---

## Key Takeaways

- Prompt engineering includes prompt design, evaluation, and refinement.
- A good prompt needs clear content and proper structure.
- Vertex AI Studio helps create, test, compare, and manage prompts.
- Gemini can assist in writing prompts.
- Prompt templates make prompts reusable with variables.
- Model parameters like temperature, Top K, and Top P control randomness.
- Low temperature is better for factual and structured tasks.
- High temperature is better for creative tasks.
- Prompt comparison helps identify the best prompt, model, or parameter setting.
- Ground truth can be used to evaluate model output.
- Prompt management helps save, share, version, and secure prompts.

---

## Simple Summary

Prompt engineering is the process of improving prompts so that generative AI models produce better results. In Vertex AI Studio, prompts can be designed using system instructions, tasks, examples, multimedia inputs, and templates.

After creating a prompt, model parameters such as temperature, Top K, and Top P can be adjusted to control output style. Prompts can then be evaluated, compared, refined, saved, and managed for future use or production deployment.
