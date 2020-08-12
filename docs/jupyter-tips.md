## Process of creating a Jupyter notebook

### Create an outline

* Setup libraries
* Get data
* Clean data
* Get summary
* Get detail 1
* Get detail 2

### Use the "Collapsible headings" extension

* to refine the outline

### Add a text summary before a code cell

* Example: Calculate average age - (verb noun format)

### Write code

* Use "Code prettify" to clean the code
* use the autoload extension

### Debug code

* Use the snoop extension for Jupyter https://github.com/alexmojaki/snoop

### Execute code

* Use "ExecuteTime" to measure cell execution time
* Cache data for long running cells

### Clean code

* Use jupytext to convert notebook to Python
* Use flake8 to flag style issues
* Use yapf or black to format code
* Use vulture to find unused code
* Use jupytext to convert back to notebook
* Use jupyter nbconvert to execute notebook

Add the following to the ~/.config/vifm/vifmrc file

```
" Convert notebook to Python file
nnoremap ,p :!jupytext --to py %f %m<cr>

" Convert python file to Notebook
nnoremap ,n :!jupytext --to notebook %f %m<cr>

" execute notebook inplace
nnoremap ,e :!jupyter nbconvert --to notebook --ExecutePreprocessor.timeout=300 --inplace --execute %f %s<cr>
```

### Get data

* Use df.info() and df.describe() to summarize data frame

### Clean data

* Use pyjanitor to clean data

### Use tables to summarize data

* Create data frames as they can be styled
* Display multiple tables side by side
* https://stackoverflow.com/questions/38783027/jupyter-notebook-display-two-pandas-tables-side-by-side

### Use charts to show summaries

[_] Use small multiples when comparing segments
[_] Add titles to describe chart
    [_] Add numbers to titles
        [_] e.g. Histogram of heights of 23 basketball players
[_] Use svg for editable charts
[_] Use high dpi for better quality charts

### Annotate charts

[_] Use horizontal or vertical lines to divide segments
[_] Add arrows to highlight data

### Create graphs

Use graphviz
Use mermaid
Show process of filtering data
Raterize the svg graphs at high dpi

### Add a text summary after the table or chart

* Use the "hide input all" to hide code cells
