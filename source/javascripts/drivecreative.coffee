class CaseStudyLinks
  constructor: ->
    @links = $('.case-studies li a')
    @links.click @goToLink

  goToLink: (event) ->
    event.preventDefault()
    link_target = event.currentTarget
    case_study = $(link_target).data('goto')
    target_element = $(".sample.#{case_study}")
    $('.pages').animate
      scrollTop: "#{target_element.position().top}px"
    , 1000

$ ->
  $('.full-width-video').fitVids()

  new CaseStudyLinks
