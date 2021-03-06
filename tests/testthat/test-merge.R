context("merg/standardize GatingSets")
skip_if(win32_flag)

suppressMessages(gs0 <- load_gs(file.path(dataDir,"gs_manual")))
suppressMessages(gs1 <- gs_clone(gs0))
sampleNames(gs1) <- "1.fcs"

# simply the tree
nodes <- gs_get_pop_paths(gs1)
for(toRm in nodes[grepl("CCR", nodes)])
  gs_pop_remove(toRm, gs = gs1)

# remove two terminal nodes
suppressMessages(gs2 <- gs_clone(gs1))
sampleNames(gs2) <- "2.fcs"
#create a merged gs
suppressMessages(gs6 <- gs_clone(merge_list_to_gs(list(gs1, gs2))))
gh_pop_remove("DPT", gh = gs6[[1]])
gh_pop_remove("DNT", gh = gs6[[1]])

gs_pop_remove("DPT", gs = gs2)
gs_pop_remove("DNT", gs = gs2)

# remove singlets gate
suppressMessages(gs3 <- gs_clone(gs2))
gh_pop_move(gs3[[1]], "CD3+", "not debris")
gs_pop_remove("singlets", gs = gs3)
sampleNames(gs3) <- "3.fcs"

# spin the branch to make it isomorphic
suppressMessages(gs4 <- gs_clone(gs3))
# mv cd4 branch first
gh_pop_move(gs4[[1]], "CD4", "root")
# cp it back
gh_copy_gate(gs4[[1]], "CD4", "CD3+")
# rm cp
gs_pop_remove("/CD4", gs = gs4)
sampleNames(gs4) <- "4.fcs"

suppressMessages(gs5 <- gs_clone(gs4))
# add another redundant node
suppressMessages(gs_pop_add(gs5, gs_pop_get_gate(gs0, "CD4/CCR7+ 45RA+")[[1]], parent = "CD4"))
suppressMessages(gs_pop_add(gs5, gs_pop_get_gate(gs0, "CD4/CCR7+ 45RA-")[[1]], parent = "CD4"))
sampleNames(gs5) <- "5.fcs"


gs_groups <- NULL
gslist <- list(gs1, gs2, gs3, gs4, gs5)
test_that("gs_split_by_tree", {
  
  gs_groups <<- gs_split_by_tree(gslist)
  expect_equal(length(gs_groups), 4)
  
})

toRm <- NULL
test_that("gs_check_redundant_nodes", {
  expect_error(gs_check_redundant_nodes(gs_groups), "Can't drop the non-terminal nodes: singlets")
  for(i in c(2,4))
    for(gs in gs_groups[[i]])
      invisible(gs_pop_set_visibility(gs, "singlets", FALSE))
  toRm <<- gs_check_redundant_nodes(gs_groups)
  expect_equal(toRm, list(c("CCR7+ 45RA+", "CCR7+ 45RA-")
                          , c("DNT", "DPT")
                          , character(0)
                          , character(0))
               )
  
  
})

test_that("gs_remove_redundant_nodes", {
  gs_remove_redundant_nodes(gs_groups, toRm)
  expect_equal(length(gs_split_by_tree(gslist)), 1)
})

test_that("gs_remove_redundant_channels", {
  gs1 <- gs_remove_redundant_channels(gs1)
  expect_equal(setdiff(colnames(gs0), colnames(gs1)), c("FSC-H", "FSC-W", "<G560-A>", "<G780-A>", "Time"))
})

test_that("group and merge the GatingSet object", {
  #test gs version
  gs_groups <- gs_split_by_tree(gs6)
  expect_equal(length(gs_groups), 2)
  toRm <- gs_check_redundant_nodes(gs_groups)
  expect_equal(toRm, list(c("DNT", "DPT"), character(0)))
  gs_remove_redundant_nodes(gs_groups, toRm)
  expect_equal(length(gs_split_by_tree(gs6)), 1)
  
})

