testthat::skip_on_cran()

jlmerclusterperm_setup(cache_dir = tempdir(), restart = FALSE, verbose = FALSE)

test_that("No side effects when called empty", {
  expect_equal(julia_progress(), julia_progress())
})

default_opts <- julia_progress()

test_that("Side effect by show, width, or both", {
  julia_progress(show = FALSE)
  expect_equal(julia_progress()$show, FALSE)
  julia_progress(width = 20)
  expect_equal(julia_progress()$width, 20)
  julia_progress(default_opts)
  expect_equal(julia_progress(), default_opts)
})

test_that("Restore startup option", {
  julia_progress(show = TRUE, width = "auto")
  expect_equal(default_opts, julia_progress())
})
