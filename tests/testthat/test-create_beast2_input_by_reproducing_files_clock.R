context(
  paste(
    "create_beast2_input by reproducing files,",
    "multiple alignments with combinations of clock models"
  )
)

################################################################################
# Two alignments
################################################################################

test_that("aco_nd2_strict_strict_2_4.xml, strict strict", {

  skip("Only experimental support for multiple clock models")

  created <- beautier::create_beast2_input(
    input_filenames = beautier::get_beautier_paths(
      c("anthus_aco.fas", "anthus_nd2.fas")
    ),
    clock_models = list(
      create_strict_clock_model(
        clock_rate_distr = create_uniform_distr(id = 2)
      ),
      create_strict_clock_model(
        clock_rate_distr = create_uniform_distr(id = 3)
      )
    ),
    tree_priors = list(
      create_yule_tree_prior(
        birth_rate_distr = create_uniform_distr(id = 1)),
      create_yule_tree_prior(
        birth_rate_distr = create_uniform_distr(id = 4))
    ),
    misc_options = create_misc_options(
      capitalize_first_char_id = FALSE,
      nucleotides_uppercase = TRUE
    )
  )
  expected <- readLines(beautier::get_beautier_path(
    "aco_nd2_strict_strict_2_4.xml"))

  testthat::expect_true(
    beautier:::are_equivalent_xml_lines(
      created, expected, section = "state")
  )
  testthat::expect_true(
    beautier:::are_equivalent_xml_lines(created, expected,
      section = "distribution")
  )
  testthat::expect_true(
    beautier:::are_equivalent_xml_lines(created, expected,
      section = "operators")
  )
  testthat::expect_true(
    beautier:::are_equivalent_xml_lines(created, expected,
      section = "loggers")
  )
  testthat::expect_true(
    beautier:::are_equivalent_xml_lines(created, expected)
  )
})

test_that("aco_nd2_strict_rln_2_4.xml, strict RLN, example 10", {

  skip("Only experimental support for multiple alignments")

  created <- beautier::create_beast2_input(
    input_filenames = beautier::get_beautier_paths(
      c("anthus_aco.fas", "anthus_nd2.fas")
    ),
    site_models = list(
      create_jc69_site_model(
        gamma_site_model = create_gamma_site_model(
          gamma_cat_count = 0
        )
      ),
      create_jc69_site_model(
        gamma_site_model = create_gamma_site_model(
          gamma_cat_count = 0
        )
      )
    ),
    clock_models = list(
      create_strict_clock_model(
        clock_rate_distr = create_uniform_distr(id = 2)
      ),
      create_rln_clock_model(
        ucldstdev_distr = create_gamma_distr(
          id = 0,
          alpha = create_alpha_param(id = 3, value = "0.5396"),
          beta = create_beta_param(id = 4, value = "0.3819")
        ),
        mean_rate_prior_distr = create_uniform_distr(id = 6),
        mparam_id = 2
      )
    ),
    tree_priors = list(
      create_yule_tree_prior(
        birth_rate_distr = create_uniform_distr(id = 1)),
      create_yule_tree_prior(
        birth_rate_distr = create_uniform_distr(id = 4))
    ),
    misc_options = create_misc_options(
      capitalize_first_char_id = FALSE,
      nucleotides_uppercase = TRUE
    )
  )
  expected <- readLines(beautier::get_beautier_path(
    "aco_nd2_strict_rln_2_4.xml"))

  testthat::expect_true(
    beautier:::are_equivalent_xml_lines(
      created, expected, section = "state")
  )
  testthat::expect_true(
    beautier:::are_equivalent_xml_lines(created, expected,
      section = "distribution")
  )
  testthat::expect_true(
    beautier:::are_equivalent_xml_lines(created, expected,
      section = "operators")
  )
  testthat::expect_true(
    beautier:::are_equivalent_xml_lines(created, expected,
      section = "loggers")
  )
  testthat::expect_true(
    beautier:::are_equivalent_xml_lines(created, expected)
  )
})

test_that("aco_nd2_rln_rln_2_4.xml, RLN RLN", {

  skip("Only experimental support for multiple clock models")

  created <- beautier::create_beast2_input(
    input_filenames = beautier::get_beautier_paths(
      c("anthus_aco.fas", "anthus_nd2.fas")
    ),
    clock_models = list(
      create_rln_clock_model(
        id = "anthus_aco",
        ucldstdev_distr = create_gamma_distr(
          id = 6,
          alpha = create_alpha_param(id = 21, value = "0.5396"),
          beta = create_beta_param(id = 22, value = "0.3819")
        ),
        mean_rate_prior_distr = create_uniform_distr(id = "irrelevant"),
        mparam_id = 20
      ),
      create_rln_clock_model(
        id = "anthus_nd2",
        ucldstdev_distr = create_gamma_distr(
          id = 14,
          alpha = create_alpha_param(id = 64, value = "0.5396"),
          beta = create_beta_param(id = 65, value = "0.3819")
        ),
        mean_rate_prior_distr = create_uniform_distr(id = 14),
        mparam_id = 63
      )
    ),
    tree_priors = list(
      create_yule_tree_prior(
        birth_rate_distr = create_uniform_distr(id = 1)
      ),
      create_yule_tree_prior(
        birth_rate_distr = create_uniform_distr(id = 4)
      )
    ),
    misc_options = create_misc_options(nucleotides_uppercase = TRUE)
  )
  expected <- readLines(beautier::get_beautier_path(
    "aco_nd2_rln_rln_2_4.xml"))

  testthat::expect_true(
    beautier:::are_equivalent_xml_lines(
      created, expected, section = "state")
  )
  testthat::expect_true(
    beautier:::are_equivalent_xml_lines(created, expected,
      section = "distribution")
  )
  testthat::expect_true(
    beautier:::are_equivalent_xml_lines(created, expected,
      section = "operators")
  )
  testthat::expect_true(
    beautier:::are_equivalent_xml_lines(created, expected,
      section = "loggers")
  )
  testthat::expect_true(beautier:::are_equivalent_xml_lines(created, expected))
})


################################################################################
# Three alignments
################################################################################


################################################################################
# Four alignments
################################################################################

test_that("aco_nd2_nd3_nd4_shared_clock_2_4.xml", {

  skip("Only experimental support for multiple alignments")

  created <- beautier::create_beast2_input(
    input_filenames = beautier::get_beautier_paths(
      c("anthus_aco.fas", "anthus_nd2.fas", "anthus_nd3.fas", "anthus_nd4.fas")
    ),
    clock_models = list(
      create_strict_clock_model(id = "anthus_aco"),
      create_strict_clock_model(id = "anthus_aco"),
      create_strict_clock_model(id = "anthus_aco"),
      create_strict_clock_model(id = "anthus_aco")
    ),
    tree_priors = list(
      create_yule_tree_prior(
        birth_rate_distr = create_uniform_distr(id = 1)),
      create_yule_tree_prior(
        birth_rate_distr = create_uniform_distr(id = 4)),
      create_yule_tree_prior(
        birth_rate_distr = create_uniform_distr(id = 7)),
      create_yule_tree_prior(
        birth_rate_distr = create_uniform_distr(id = 10))
    ),
    misc_options = create_misc_options(
      capitalize_first_char_id = FALSE,
      nucleotides_uppercase = TRUE
    )
  )
  expected <- readLines(beautier::get_beautier_path(
    "aco_nd2_nd3_nd4_shared_clock_2_4.xml"))

  testthat::expect_true(
    beautier:::are_equivalent_xml_lines(
      created, expected, section = "state")
  )
  testthat::expect_true(
    beautier:::are_equivalent_xml_lines(created, expected,
      section = "distribution")
  )
  testthat::expect_true(
    beautier:::are_equivalent_xml_lines(created, expected,
      section = "operators")
  )
  testthat::expect_true(beautier:::are_equivalent_xml_lines(created, expected))
})
