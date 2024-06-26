# Degrees of Difference: Analyzing the Impact of Education on Earnings in Canada

## Overview

The repository contains a study that investigates the impact of education levels on the average hourly wage rate for Canadians aged 25-54, using data from 2000 to 2019. It methodically examines the correlation between educational attainment and the average hourly wage rate through a linear regression model. By transforming educational levels into numeric values, the study constructs a clear, quantitative representation of the educational hierarchy and its influence on earnings. The findings aim to provide evidence to reinforce the hypothesis that higher educational attainment is associated with increased earnings within the targeted demographic, offering valuable insights for economic and educational policy-making.

## File Structure

The repo is structured as:

-   `data/raw_data` contains the raw data as obtained from the Government of Ontario.
-   `data/analysis_data` contains the cleaned dataset that was constructed.
-   `model` contains fitted models.
-   `other` contains a datasheet, details about LLM chat interactions, and sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper.
-   `scripts` contains the R scripts used to simulate, clean, test, and model data.

## Statement on LLM usage

The ChatGPT-4 model contributed to the creation of data validation tests and the polishing of wording. The entire chat history is available in `other/llm/usage.txt`.

------------------------------------------------------------------------

*Note: Our script does not include a feature for data downloading. For those interested in acquiring the datasets, please visit [Open Government Canada](https://open.canada.ca/data/en/dataset/1f14addd-e4fc-4a07-9982-ad98db07ef86/resource/7a7932bd-0cb5-440e-b3e2-ecfd3f840144) to obtain the necessary datasets. The relevant file is named 'Wages by education level'. After downloading, please place the raw data into the `data/raw_data` directory and execute `00-install_packages.R` to ensure all necessary packages are installed. Then, you can proceed to use the read function in R to import the data for further analysis with our R scripts.*

------------------------------------------------------------------------
