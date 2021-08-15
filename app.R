# app to generate an ego-network (N=10)

# Example of a Survey using the ShinyPsych package
#
# Code sections:
#   - Section 0: Load Libraries
#   - Section A: assign external values
#   - Section B: Define overall layout
#   - Section C: Define reactive values
#   - Section D: Page layouts
#   - Section F: Event (e.g. button) actions
#       - Section F1: Page navigation button
#       - Section F2: Event Control
#   - Section G: Save Data

# Section 0: Load Libraries ====================================================

library(shiny)
library(shinyjs)
library(ShinyPsych)


# Section A: assign external values ============================================

# Vector with page ids used to later access objects
idsVec <- c("Instructions", "ListNodes", "ListLinks", "Pregoodbye", "Goodbye") 

# create page lists for the instructions and the last page
instructions.list <- createPageList(fileName = "0_Instruction.txt",
                                    globId = "Instructions", defaulttxt = F) # set defaulttxt to false

listnodes.list <- createPageList(fileName = "1_List.txt",
                              globId = "ListNodes", defaulttxt = F)

listlinks.list <- createPageList(fileName = "2_Alter.txt",
                                 globId = "ListLinks", defaulttxt = F)

pregoodbye.list <- createPageList(fileName = "Pregoodbye2.txt",  globId = 'Pregoodbye', defaulttxt = F)

goodbye.list <- createPageList(fileName = "Goodbye.txt",  globId = 'Goodbye', defaulttxt = F)

# Section B: Define overall layout =============================================

ui <- fixedPage(
  
  # App title
  title = "NiP: SNA",
  uiOutput("MainAction"),
  
  # For Shinyjs functions
  useShinyjs(),
  
  # include appropriate css and js scripts
  includeScriptFiles()
  
)

server <- function(input, output, session) {
  
  output$MainAction <- renderUI( {
    PageLayouts()
    
  })
  
  # Section C: Define Reactive Values ==========================================
  
  # CurrentValues controls page setting such as which page to display
  CurrentValues <- createCtrlList(firstPage = "Instructions", # id of the first page
                                  globIds = idsVec,           # ids of pages for createPage
                                  complCode = F)              # create a completion code

  # Section D: Page Layouts ====================================================
  
  PageLayouts <- reactive({
    
    # display instructions page
    if (CurrentValues$page == "Instructions") {
      
      return(
        # create html logic of instructions page
        createPage(pageList = instructions.list,
                   pageNumber = CurrentValues$Instructions.num,
                   globId = "Instructions", ctrlVals = CurrentValues)
      )}
    
    # display survey page
    if (CurrentValues$page == "ListNodes") {
      
      return(
        # create html logic of instructions page
        createPage(pageList = listnodes.list,
                   pageNumber = CurrentValues$ListNodes.num,
                   globId = "ListNodes", ctrlVals = CurrentValues)
      )}
    
    # get 10 node names and replace placeholder 
    listlinks.list <- changePageVariable(pageList = listlinks.list, variable = 'text',
                                            oldLabel = 'z[1]', newLabel = input$ListNodes_a1)
    listlinks.list <- changePageVariable(pageList = listlinks.list, variable = 'text',
                                            oldLabel = 'z[2]', newLabel = input$ListNodes_a2)
    listlinks.list <- changePageVariable(pageList = listlinks.list, variable = 'text',
                                         oldLabel = 'z[3]', newLabel = input$ListNodes_a3)
    listlinks.list <- changePageVariable(pageList = listlinks.list, variable = 'text',
                                         oldLabel = 'z[4]', newLabel = input$ListNodes_a4)
    listlinks.list <- changePageVariable(pageList = listlinks.list, variable = 'text',
                                         oldLabel = 'z[5]', newLabel = input$ListNodes_a5)
    listlinks.list <- changePageVariable(pageList = listlinks.list, variable = 'text',
                                         oldLabel = 'z[6]', newLabel = input$ListNodes_a6)
    listlinks.list <- changePageVariable(pageList = listlinks.list, variable = 'text',
                                         oldLabel = 'z[7]', newLabel = input$ListNodes_a7)
    listlinks.list <- changePageVariable(pageList = listlinks.list, variable = 'text',
                                         oldLabel = 'z[8]', newLabel = input$ListNodes_a8)
    listlinks.list <- changePageVariable(pageList = listlinks.list, variable = 'text',
                                         oldLabel = 'z[9]', newLabel = input$ListNodes_a9)
    listlinks.list <- changePageVariable(pageList = listlinks.list, variable = 'text',
                                         oldLabel = 'z[10]', newLabel = input$ListNodes_a10)
    
    
    if (CurrentValues$page == "ListLinks"){
      
      return(
        createPage(pageList = listlinks.list, pageNumber = CurrentValues$ListLinks.num,
                    globId = "ListLinks", ctrlVals = CurrentValues)
      )}
    
    
    pregoodbye.list <- changePageVariable(
      pageList = pregoodbye.list, variable = 'text', oldLabel = 'nodes', 
      newLabel = paste(input$ListNodes_a1, input$ListNodes_a2, input$ListNodes_a3,
                       input$ListNodes_a4, input$ListNodes_a5, input$ListNodes_a6,
                       input$ListNodes_a7, input$ListNodes_a8, input$ListNodes_a9,
                       input$ListNodes_a10))
    
    pregoodbye.list <- changePageVariable(
      pageList = pregoodbye.list, variable = 'text', oldLabel = 'edges_a1', 
      newLabel = paste(input$ListLinks_a1_1, input$ListLinks_a1_2, input$ListLinks_a1_3,
                       input$ListLinks_a1_4, input$ListLinks_a1_5, input$ListLinks_a1_6,
                       input$ListLinks_a1_7, input$ListLinks_a1_8, input$ListLinks_a1_9,
                       input$ListLinks_a1_10))
    
    pregoodbye.list <- changePageVariable(
      pageList = pregoodbye.list, variable = 'text', oldLabel = 'edges_a2', 
      newLabel = paste(input$ListLinks_a2_1, input$ListLinks_a2_2, input$ListLinks_a2_3,
                       input$ListLinks_a2_4, input$ListLinks_a2_5, input$ListLinks_a2_6,
                       input$ListLinks_a2_7, input$ListLinks_a2_8, input$ListLinks_a2_9,
                       input$ListLinks_a2_10))
    
    pregoodbye.list <- changePageVariable(
      pageList = pregoodbye.list, variable = 'text', oldLabel = 'edges_a3', 
      newLabel = paste(input$ListLinks_a3_1, input$ListLinks_a3_2, input$ListLinks_a3_3,
                       input$ListLinks_a3_4, input$ListLinks_a3_5, input$ListLinks_a3_6,
                       input$ListLinks_a3_7, input$ListLinks_a3_8, input$ListLinks_a3_9,
                       input$ListLinks_a3_10))
    
    pregoodbye.list <- changePageVariable(
      pageList = pregoodbye.list, variable = 'text', oldLabel = 'edges_a4', 
      newLabel = paste(input$ListLinks_a4_1, input$ListLinks_a4_2, input$ListLinks_a4_3,
                       input$ListLinks_a4_4, input$ListLinks_a4_5, input$ListLinks_a4_6,
                       input$ListLinks_a4_7, input$ListLinks_a4_8, input$ListLinks_a4_9,
                       input$ListLinks_a4_10))
    
    pregoodbye.list <- changePageVariable(
      pageList = pregoodbye.list, variable = 'text', oldLabel = 'edges_a5', 
      newLabel = paste(input$ListLinks_a5_1, input$ListLinks_a5_2, input$ListLinks_a5_3,
                       input$ListLinks_a5_4, input$ListLinks_a5_5, input$ListLinks_a5_6,
                       input$ListLinks_a5_7, input$ListLinks_a5_8, input$ListLinks_a5_9,
                       input$ListLinks_a5_10))
    
    pregoodbye.list <- changePageVariable(
      pageList = pregoodbye.list, variable = 'text', oldLabel = 'edges_a6', 
      newLabel = paste(input$ListLinks_a6_1, input$ListLinks_a6_2, input$ListLinks_a6_3,
                       input$ListLinks_a6_4, input$ListLinks_a6_5, input$ListLinks_a6_6,
                       input$ListLinks_a6_7, input$ListLinks_a6_8, input$ListLinks_a6_9,
                       input$ListLinks_a6_10))
    
    pregoodbye.list <- changePageVariable(
      pageList = pregoodbye.list, variable = 'text', oldLabel = 'edges_a7', 
      newLabel = paste(input$ListLinks_a7_1, input$ListLinks_a7_2, input$ListLinks_a7_3,
                       input$ListLinks_a7_4, input$ListLinks_a7_5, input$ListLinks_a7_6,
                       input$ListLinks_a7_7, input$ListLinks_a7_8, input$ListLinks_a7_9,
                       input$ListLinks_a7_10))
    
    pregoodbye.list <- changePageVariable(
      pageList = pregoodbye.list, variable = 'text', oldLabel = 'edges_a8', 
      newLabel = paste(input$ListLinks_a8_1, input$ListLinks_a8_2, input$ListLinks_a8_3,
                       input$ListLinks_a8_4, input$ListLinks_a8_5, input$ListLinks_a8_6,
                       input$ListLinks_a8_7, input$ListLinks_a8_8, input$ListLinks_a8_9,
                       input$ListLinks_a8_10))
    
    pregoodbye.list <- changePageVariable(
      pageList = pregoodbye.list, variable = 'text', oldLabel = 'edges_a9', 
      newLabel = paste(input$ListLinks_a9_1, input$ListLinks_a9_2, input$ListLinks_a9_3,
                       input$ListLinks_a9_4, input$ListLinks_a9_5, input$ListLinks_a9_6,
                       input$ListLinks_a9_7, input$ListLinks_a9_8, input$ListLinks_a9_9,
                       input$ListLinks_a9_10))
    
    pregoodbye.list <- changePageVariable(
      pageList = pregoodbye.list, variable = 'text', oldLabel = 'edges_a10', 
      newLabel = paste(input$ListLinks_a10_1, input$ListLinks_a10_2, input$ListLinks_a10_3,
                       input$ListLinks_a10_4, input$ListLinks_a10_5, input$ListLinks_a10_6,
                       input$ListLinks_a10_7, input$ListLinks_a10_8, input$ListLinks_a10_9,
                       input$ListLinks_a10_10))
    
    if (CurrentValues$page == "Pregoodbye") {

      return(
        # create html logic of instructions page
        createPage(pageList = pregoodbye.list,
                   pageNumber = CurrentValues$Pregoodbye.num,
                   globId = "Pregoodbye", ctrlVals = CurrentValues)
      )}
    
    # P5) Goodbye
    if (CurrentValues$page == "Goodbye") {
      
      return(
        createPage(pageList = goodbye.list, pageNumber = CurrentValues$Goodbye.num,
                   globId = "Goodbye", ctrlVals = CurrentValues, continueButton = FALSE)
      )}
    
  })
  
  
  # Section F: Event (e.g.; button) actions ======================================
  
  # Section F1: Page Navigation Buttons ----------------------
  
  observeEvent(input[["Instructions_next"]],{
    nextPage(pageId = "Instructions", ctrlVals = CurrentValues, nextPageId = "ListNodes",
             pageList = instructions.list, globId = "Instructions")
  })
  
  observeEvent(input[["ListNodes_next"]],{
    nextPage(pageId = "ListNodes", ctrlVals = CurrentValues,
             nextPageId = "ListLinks", pageList = listnodes.list,
             globId = "ListNodes")
  })
  
  observeEvent(input[["ListLinks_next"]],{
    nextPage(pageId = "ListLinks", ctrlVals = CurrentValues,
             nextPageId = "Pregoodbye", pageList = listlinks.list,
             globId = "ListLinks")
  })
  
  observeEvent(input[["Pregoodbye_next"]],{
    nextPage(pageId = "Pregoodbye", ctrlVals = CurrentValues,
             nextPageId = "Goodbye", pageList = pregoodbye.list,
             globId = "Pregoodbye")
  })
  
  # Section F2: Event Control ----------------------
  
  # Make sure answers are selected
  observeEvent(reactiveValuesToList(input),{
    
    onInputEnable(pageId = "Instructions", ctrlVals = CurrentValues,
                  pageList = instructions.list, globId = "Instructions",
                  inputList = input, charNum = 1)
    
    onInputEnable(pageId = "ListNodes", ctrlVals = CurrentValues,
                  pageList = listnodes.list, globId = "ListNodes",
                  inputList = input, charNum = 1)
    
    onInputEnable(pageId = "ListLinks", ctrlVals = CurrentValues,
                  pageList = listlinks.list, globId = "ListLinks",
                  inputList = input, charNum = 1)

  })
  
  # Section G: Save data =========================================================
  
  # observeEvent(input[["Pregoodbye_next"]], {( # do not save data 
  #   
  #   # Create progress message
  #   withProgress(message = "Saving data...", value = 0, {
  #     
  #     incProgress(.25)
  #     
  #     # Create a list to save data - adj mat 
  #     data.list <- list(  
  #       'alter_list' = c(input$ListNodes_a1, input$ListNodes_a2, input$ListNodes_a3),
  #       'alter1_links' = c(input$ListLinks_a1_1, input$ListLinks_a1_2, input$ListLinks_a1_3),
  #       'alter2_links' = c(input$ListLinks_a2_1, input$ListLinks_a2_2, input$ListLinks_a2_3), 
  #       'alter3_links' = c(input$ListLinks_a3_1, input$ListLinks_a3_2, input$ListLinks_a3_3)
  #     )
  #     
  #     saveData(data.list, location = 'local', checkNull = T, partId = 'socialNet') # saves to the current working directory, may not work on the server 
  #     
  #     CurrentValues$page <- "Goodbye"
  #     
  #   })
  #   
  # )})
  
}

# Create app!
shinyApp(ui = ui, server = server)
