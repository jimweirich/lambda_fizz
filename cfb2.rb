require './interface'
puts to_strings(
->(limit) {
  ->(lst) {
    ->(f) {
      ->(f) {
        ->(g) {
          ->(n) {
            f.(g.(g)).(n)
          }
        }.(->(g) {
          ->(n) {
            f.(g.(g)).(n)
          }
        })
      }.(->(partial) {
        ->(lst) {
          ->(initial) {
            ->(f) {
              ->(p) {
                p.(->(left) {
                  ->(right) {
                    left
                  }
                })
              }.(lst).(initial).(->(x) {
                f.(->(lst) {
                  ->(p) {
                    p.(->(left) {
                      ->(right) {
                        left
                      }
                    })
                  }.(->(p) {
                    p.(->(left) {
                      ->(right) {
                        right
                      }
                    })
                  }.(lst))
                }.(lst)).(partial.(->(lst) {
                  ->(p) {
                    p.(->(left) {
                      ->(right) {
                        right
                      }
                    })
                  }.(->(p) {
                    p.(->(left) {
                      ->(right) {
                        right
                      }
                    })
                  }.(lst))
                }.(lst)).(initial).(f)).(x)
              })
            }
          }
        }
      }).(lst).(->(left) {
        ->(right) {
          ->(f) {
            f.(left).(right)
          }
        }
      }.(->(a) {
        ->(b) {
          a
        }
      }).(->(a) {
        ->(b) {
          a
        }
      })).(->(item) {
        ->(lst) {
          ->(item) {
            ->(lst) {
              ->(left) {
                ->(right) {
                  ->(f) {
                    f.(left).(right)
                  }
                }
              }.(->(a) {
                ->(b) {
                  b
                }
              }).(->(left) {
                ->(right) {
                  ->(f) {
                    f.(left).(right)
                  }
                }
              }.(item).(lst))
            }
          }.(f.(item)).(lst)
        }
      })
    }
  }.(->(f) {
    ->(g) {
      ->(n) {
        f.(g.(g)).(n)
      }
    }.(->(g) {
      ->(n) {
        f.(g.(g)).(n)
      }
    })
  }.(->(partial) {
    ->(lst) {
      ->(n) {
        ->(n) {
          n.(->(x) {
            ->(a) {
              ->(b) {
                b
              }
            }
          }).(->(a) {
            ->(b) {
              a
            }
          })
        }.(n).(lst).(->(x) {
          partial.(->(item) {
            ->(lst) {
              ->(left) {
                ->(right) {
                  ->(f) {
                    f.(left).(right)
                  }
                }
              }.(->(a) {
                ->(b) {
                  b
                }
              }).(->(left) {
                ->(right) {
                  ->(f) {
                    f.(left).(right)
                  }
                }
              }.(item).(lst))
            }
          }.(n).(lst)).(->(n) {
            ->(p) {
              p.(->(left) {
                ->(right) {
                  right
                }
              })
            }.(n.(->(pair) {
              ->(left) {
                ->(right) {
                  ->(f) {
                    f.(left).(right)
                  }
                }
              }.(->(n) {
                ->(f) {
                  ->(v) {
                    f.(n.(f).(v))
                  }
                }
              }.(->(p) {
                p.(->(left) {
                  ->(right) {
                    left
                  }
                })
              }.(pair))).(->(p) {
                p.(->(left) {
                  ->(right) {
                    left
                  }
                })
              }.(pair))
            }).(->(left) {
              ->(right) {
                ->(f) {
                  f.(left).(right)
                }
              }
            }.(->(f) {
              ->(v) {
                v
              }
            }).(->(f) {
              ->(v) {
                v
              }
            })))
          }.(n)).(x)
        })
      }
    }
  }).(->(left) {
    ->(right) {
      ->(f) {
        f.(left).(right)
      }
    }
  }.(->(a) {
    ->(b) {
      a
    }
  }).(->(a) {
    ->(b) {
      a
    }
  })).(limit)).(->(n) {
    ->(n) {
      n.(->(x) {
        ->(a) {
          ->(b) {
            b
          }
        }
      }).(->(a) {
        ->(b) {
          a
        }
      })
    }.(->(f) {
      ->(g) {
        ->(n) {
          f.(g.(g)).(n)
        }
      }.(->(g) {
        ->(n) {
          f.(g.(g)).(n)
        }
      })
    }.(->(partial) {
      ->(a) {
        ->(b) {
          ->(a) {
            ->(b) {
              ->(bool) {
                bool.(->(a) {
                  ->(b) {
                    b
                  }
                }).(->(a) {
                  ->(b) {
                    a
                  }
                })
              }.(->(a) {
                ->(b) {
                  ->(n) {
                    n.(->(x) {
                      ->(a) {
                        ->(b) {
                          b
                        }
                      }
                    }).(->(a) {
                      ->(b) {
                        a
                      }
                    })
                  }.(->(a) {
                    ->(b) {
                      b.(->(n) {
                        ->(p) {
                          p.(->(left) {
                            ->(right) {
                              right
                            }
                          })
                        }.(n.(->(pair) {
                          ->(left) {
                            ->(right) {
                              ->(f) {
                                f.(left).(right)
                              }
                            }
                          }.(->(n) {
                            ->(f) {
                              ->(v) {
                                f.(n.(f).(v))
                              }
                            }
                          }.(->(p) {
                            p.(->(left) {
                              ->(right) {
                                left
                              }
                            })
                          }.(pair))).(->(p) {
                            p.(->(left) {
                              ->(right) {
                                left
                              }
                            })
                          }.(pair))
                        }).(->(left) {
                          ->(right) {
                            ->(f) {
                              f.(left).(right)
                            }
                          }
                        }.(->(f) {
                          ->(v) {
                            v
                          }
                        }).(->(f) {
                          ->(v) {
                            v
                          }
                        })))
                      }).(a)
                    }
                  }.(a).(b))
                }
              }.(b).(a))
            }
          }.(a).(b).(a).(->(x) {
            partial.(->(a) {
              ->(b) {
                b.(->(n) {
                  ->(p) {
                    p.(->(left) {
                      ->(right) {
                        right
                      }
                    })
                  }.(n.(->(pair) {
                    ->(left) {
                      ->(right) {
                        ->(f) {
                          f.(left).(right)
                        }
                      }
                    }.(->(n) {
                      ->(f) {
                        ->(v) {
                          f.(n.(f).(v))
                        }
                      }
                    }.(->(p) {
                      p.(->(left) {
                        ->(right) {
                          left
                        }
                      })
                    }.(pair))).(->(p) {
                      p.(->(left) {
                        ->(right) {
                          left
                        }
                      })
                    }.(pair))
                  }).(->(left) {
                    ->(right) {
                      ->(f) {
                        f.(left).(right)
                      }
                    }
                  }.(->(f) {
                    ->(v) {
                      v
                    }
                  }).(->(f) {
                    ->(v) {
                      v
                    }
                  })))
                }).(a)
              }
            }.(a).(b)).(b).(x)
          })
        }
      }
    }).(n).(->(f) {
      ->(v) {
        f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(v)))))))))))))))
      }
    })).(->(item) {
      ->(lst) {
        ->(left) {
          ->(right) {
            ->(f) {
              f.(left).(right)
            }
          }
        }.(->(a) {
          ->(b) {
            b
          }
        }).(->(left) {
          ->(right) {
            ->(f) {
              f.(left).(right)
            }
          }
        }.(item).(lst))
      }
    }.(->(n) {
      ->(f) {
        ->(v) {
          f.(n.(f).(v))
        }
      }
    }.(->(f) {
      ->(v) {
        f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(v))))))))))
      }
    })).(->(item) {
      ->(lst) {
        ->(left) {
          ->(right) {
            ->(f) {
              f.(left).(right)
            }
          }
        }.(->(a) {
          ->(b) {
            b
          }
        }).(->(left) {
          ->(right) {
            ->(f) {
              f.(left).(right)
            }
          }
        }.(item).(lst))
      }
    }.(->(n) {
      ->(f) {
        ->(v) {
          f.(n.(f).(v))
        }
      }
    }.(->(n) {
      ->(f) {
        ->(v) {
          f.(n.(f).(v))
        }
      }
    }.(->(f) {
      ->(v) {
        f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(v))))))))))
      }
    }))).(->(item) {
      ->(lst) {
        ->(left) {
          ->(right) {
            ->(f) {
              f.(left).(right)
            }
          }
        }.(->(a) {
          ->(b) {
            b
          }
        }).(->(left) {
          ->(right) {
            ->(f) {
              f.(left).(right)
            }
          }
        }.(item).(lst))
      }
    }.(->(n) {
      ->(f) {
        ->(v) {
          f.(n.(f).(v))
        }
      }
    }.(->(n) {
      ->(f) {
        ->(v) {
          f.(n.(f).(v))
        }
      }
    }.(->(n) {
      ->(f) {
        ->(v) {
          f.(n.(f).(v))
        }
      }
    }.(->(n) {
      ->(f) {
        ->(v) {
          f.(n.(f).(v))
        }
      }
    }.(->(f) {
      ->(v) {
        f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(v))))))))))
      }
    }))))).(->(item) {
      ->(lst) {
        ->(left) {
          ->(right) {
            ->(f) {
              f.(left).(right)
            }
          }
        }.(->(a) {
          ->(b) {
            b
          }
        }).(->(left) {
          ->(right) {
            ->(f) {
              f.(left).(right)
            }
          }
        }.(item).(lst))
      }
    }.(->(n) {
      ->(f) {
        ->(v) {
          f.(n.(f).(v))
        }
      }
    }.(->(n) {
      ->(f) {
        ->(v) {
          f.(n.(f).(v))
        }
      }
    }.(->(n) {
      ->(f) {
        ->(v) {
          f.(n.(f).(v))
        }
      }
    }.(->(n) {
      ->(f) {
        ->(v) {
          f.(n.(f).(v))
        }
      }
    }.(->(f) {
      ->(v) {
        f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(v))))))))))
      }
    }))))).(->(item) {
      ->(lst) {
        ->(left) {
          ->(right) {
            ->(f) {
              f.(left).(right)
            }
          }
        }.(->(a) {
          ->(b) {
            b
          }
        }).(->(left) {
          ->(right) {
            ->(f) {
              f.(left).(right)
            }
          }
        }.(item).(lst))
      }
    }.(->(f) {
      ->(v) {
        f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(v))))))))))
      }
    }).(->(item) {
      ->(lst) {
        ->(left) {
          ->(right) {
            ->(f) {
              f.(left).(right)
            }
          }
        }.(->(a) {
          ->(b) {
            b
          }
        }).(->(left) {
          ->(right) {
            ->(f) {
              f.(left).(right)
            }
          }
        }.(item).(lst))
      }
    }.(->(n) {
      ->(f) {
        ->(v) {
          f.(n.(f).(v))
        }
      }
    }.(->(n) {
      ->(f) {
        ->(v) {
          f.(n.(f).(v))
        }
      }
    }.(->(n) {
      ->(f) {
        ->(v) {
          f.(n.(f).(v))
        }
      }
    }.(->(f) {
      ->(v) {
        f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(v))))))))))
      }
    })))).(->(item) {
      ->(lst) {
        ->(left) {
          ->(right) {
            ->(f) {
              f.(left).(right)
            }
          }
        }.(->(a) {
          ->(b) {
            b
          }
        }).(->(left) {
          ->(right) {
            ->(f) {
              f.(left).(right)
            }
          }
        }.(item).(lst))
      }
    }.(->(n) {
      ->(f) {
        ->(v) {
          f.(n.(f).(v))
        }
      }
    }.(->(n) {
      ->(f) {
        ->(v) {
          f.(n.(f).(v))
        }
      }
    }.(->(n) {
      ->(f) {
        ->(v) {
          f.(n.(f).(v))
        }
      }
    }.(->(n) {
      ->(f) {
        ->(v) {
          f.(n.(f).(v))
        }
      }
    }.(->(f) {
      ->(v) {
        f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(v))))))))))
      }
    }))))).(->(item) {
      ->(lst) {
        ->(left) {
          ->(right) {
            ->(f) {
              f.(left).(right)
            }
          }
        }.(->(a) {
          ->(b) {
            b
          }
        }).(->(left) {
          ->(right) {
            ->(f) {
              f.(left).(right)
            }
          }
        }.(item).(lst))
      }
    }.(->(n) {
      ->(f) {
        ->(v) {
          f.(n.(f).(v))
        }
      }
    }.(->(n) {
      ->(f) {
        ->(v) {
          f.(n.(f).(v))
        }
      }
    }.(->(n) {
      ->(f) {
        ->(v) {
          f.(n.(f).(v))
        }
      }
    }.(->(n) {
      ->(f) {
        ->(v) {
          f.(n.(f).(v))
        }
      }
    }.(->(f) {
      ->(v) {
        f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(v))))))))))
      }
    }))))).(->(left) {
      ->(right) {
        ->(f) {
          f.(left).(right)
        }
      }
    }.(->(a) {
      ->(b) {
        a
      }
    }).(->(a) {
      ->(b) {
        a
      }
    })))))))))).(->(n) {
      n.(->(x) {
        ->(a) {
          ->(b) {
            b
          }
        }
      }).(->(a) {
        ->(b) {
          a
        }
      })
    }.(->(f) {
      ->(g) {
        ->(n) {
          f.(g.(g)).(n)
        }
      }.(->(g) {
        ->(n) {
          f.(g.(g)).(n)
        }
      })
    }.(->(partial) {
      ->(a) {
        ->(b) {
          ->(a) {
            ->(b) {
              ->(bool) {
                bool.(->(a) {
                  ->(b) {
                    b
                  }
                }).(->(a) {
                  ->(b) {
                    a
                  }
                })
              }.(->(a) {
                ->(b) {
                  ->(n) {
                    n.(->(x) {
                      ->(a) {
                        ->(b) {
                          b
                        }
                      }
                    }).(->(a) {
                      ->(b) {
                        a
                      }
                    })
                  }.(->(a) {
                    ->(b) {
                      b.(->(n) {
                        ->(p) {
                          p.(->(left) {
                            ->(right) {
                              right
                            }
                          })
                        }.(n.(->(pair) {
                          ->(left) {
                            ->(right) {
                              ->(f) {
                                f.(left).(right)
                              }
                            }
                          }.(->(n) {
                            ->(f) {
                              ->(v) {
                                f.(n.(f).(v))
                              }
                            }
                          }.(->(p) {
                            p.(->(left) {
                              ->(right) {
                                left
                              }
                            })
                          }.(pair))).(->(p) {
                            p.(->(left) {
                              ->(right) {
                                left
                              }
                            })
                          }.(pair))
                        }).(->(left) {
                          ->(right) {
                            ->(f) {
                              f.(left).(right)
                            }
                          }
                        }.(->(f) {
                          ->(v) {
                            v
                          }
                        }).(->(f) {
                          ->(v) {
                            v
                          }
                        })))
                      }).(a)
                    }
                  }.(a).(b))
                }
              }.(b).(a))
            }
          }.(a).(b).(a).(->(x) {
            partial.(->(a) {
              ->(b) {
                b.(->(n) {
                  ->(p) {
                    p.(->(left) {
                      ->(right) {
                        right
                      }
                    })
                  }.(n.(->(pair) {
                    ->(left) {
                      ->(right) {
                        ->(f) {
                          f.(left).(right)
                        }
                      }
                    }.(->(n) {
                      ->(f) {
                        ->(v) {
                          f.(n.(f).(v))
                        }
                      }
                    }.(->(p) {
                      p.(->(left) {
                        ->(right) {
                          left
                        }
                      })
                    }.(pair))).(->(p) {
                      p.(->(left) {
                        ->(right) {
                          left
                        }
                      })
                    }.(pair))
                  }).(->(left) {
                    ->(right) {
                      ->(f) {
                        f.(left).(right)
                      }
                    }
                  }.(->(f) {
                    ->(v) {
                      v
                    }
                  }).(->(f) {
                    ->(v) {
                      v
                    }
                  })))
                }).(a)
              }
            }.(a).(b)).(b).(x)
          })
        }
      }
    }).(n).(->(f) {
      ->(v) {
        f.(f.(f.(v)))
      }
    })).(->(item) {
      ->(lst) {
        ->(left) {
          ->(right) {
            ->(f) {
              f.(left).(right)
            }
          }
        }.(->(a) {
          ->(b) {
            b
          }
        }).(->(left) {
          ->(right) {
            ->(f) {
              f.(left).(right)
            }
          }
        }.(item).(lst))
      }
    }.(->(n) {
      ->(f) {
        ->(v) {
          f.(n.(f).(v))
        }
      }
    }.(->(f) {
      ->(v) {
        f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(v))))))))))
      }
    })).(->(item) {
      ->(lst) {
        ->(left) {
          ->(right) {
            ->(f) {
              f.(left).(right)
            }
          }
        }.(->(a) {
          ->(b) {
            b
          }
        }).(->(left) {
          ->(right) {
            ->(f) {
              f.(left).(right)
            }
          }
        }.(item).(lst))
      }
    }.(->(n) {
      ->(f) {
        ->(v) {
          f.(n.(f).(v))
        }
      }
    }.(->(n) {
      ->(f) {
        ->(v) {
          f.(n.(f).(v))
        }
      }
    }.(->(f) {
      ->(v) {
        f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(v))))))))))
      }
    }))).(->(item) {
      ->(lst) {
        ->(left) {
          ->(right) {
            ->(f) {
              f.(left).(right)
            }
          }
        }.(->(a) {
          ->(b) {
            b
          }
        }).(->(left) {
          ->(right) {
            ->(f) {
              f.(left).(right)
            }
          }
        }.(item).(lst))
      }
    }.(->(n) {
      ->(f) {
        ->(v) {
          f.(n.(f).(v))
        }
      }
    }.(->(n) {
      ->(f) {
        ->(v) {
          f.(n.(f).(v))
        }
      }
    }.(->(n) {
      ->(f) {
        ->(v) {
          f.(n.(f).(v))
        }
      }
    }.(->(n) {
      ->(f) {
        ->(v) {
          f.(n.(f).(v))
        }
      }
    }.(->(f) {
      ->(v) {
        f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(v))))))))))
      }
    }))))).(->(item) {
      ->(lst) {
        ->(left) {
          ->(right) {
            ->(f) {
              f.(left).(right)
            }
          }
        }.(->(a) {
          ->(b) {
            b
          }
        }).(->(left) {
          ->(right) {
            ->(f) {
              f.(left).(right)
            }
          }
        }.(item).(lst))
      }
    }.(->(n) {
      ->(f) {
        ->(v) {
          f.(n.(f).(v))
        }
      }
    }.(->(n) {
      ->(f) {
        ->(v) {
          f.(n.(f).(v))
        }
      }
    }.(->(n) {
      ->(f) {
        ->(v) {
          f.(n.(f).(v))
        }
      }
    }.(->(n) {
      ->(f) {
        ->(v) {
          f.(n.(f).(v))
        }
      }
    }.(->(f) {
      ->(v) {
        f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(v))))))))))
      }
    }))))).(->(left) {
      ->(right) {
        ->(f) {
          f.(left).(right)
        }
      }
    }.(->(a) {
      ->(b) {
        a
      }
    }).(->(a) {
      ->(b) {
        a
      }
    })))))).(->(n) {
      n.(->(x) {
        ->(a) {
          ->(b) {
            b
          }
        }
      }).(->(a) {
        ->(b) {
          a
        }
      })
    }.(->(f) {
      ->(g) {
        ->(n) {
          f.(g.(g)).(n)
        }
      }.(->(g) {
        ->(n) {
          f.(g.(g)).(n)
        }
      })
    }.(->(partial) {
      ->(a) {
        ->(b) {
          ->(a) {
            ->(b) {
              ->(bool) {
                bool.(->(a) {
                  ->(b) {
                    b
                  }
                }).(->(a) {
                  ->(b) {
                    a
                  }
                })
              }.(->(a) {
                ->(b) {
                  ->(n) {
                    n.(->(x) {
                      ->(a) {
                        ->(b) {
                          b
                        }
                      }
                    }).(->(a) {
                      ->(b) {
                        a
                      }
                    })
                  }.(->(a) {
                    ->(b) {
                      b.(->(n) {
                        ->(p) {
                          p.(->(left) {
                            ->(right) {
                              right
                            }
                          })
                        }.(n.(->(pair) {
                          ->(left) {
                            ->(right) {
                              ->(f) {
                                f.(left).(right)
                              }
                            }
                          }.(->(n) {
                            ->(f) {
                              ->(v) {
                                f.(n.(f).(v))
                              }
                            }
                          }.(->(p) {
                            p.(->(left) {
                              ->(right) {
                                left
                              }
                            })
                          }.(pair))).(->(p) {
                            p.(->(left) {
                              ->(right) {
                                left
                              }
                            })
                          }.(pair))
                        }).(->(left) {
                          ->(right) {
                            ->(f) {
                              f.(left).(right)
                            }
                          }
                        }.(->(f) {
                          ->(v) {
                            v
                          }
                        }).(->(f) {
                          ->(v) {
                            v
                          }
                        })))
                      }).(a)
                    }
                  }.(a).(b))
                }
              }.(b).(a))
            }
          }.(a).(b).(a).(->(x) {
            partial.(->(a) {
              ->(b) {
                b.(->(n) {
                  ->(p) {
                    p.(->(left) {
                      ->(right) {
                        right
                      }
                    })
                  }.(n.(->(pair) {
                    ->(left) {
                      ->(right) {
                        ->(f) {
                          f.(left).(right)
                        }
                      }
                    }.(->(n) {
                      ->(f) {
                        ->(v) {
                          f.(n.(f).(v))
                        }
                      }
                    }.(->(p) {
                      p.(->(left) {
                        ->(right) {
                          left
                        }
                      })
                    }.(pair))).(->(p) {
                      p.(->(left) {
                        ->(right) {
                          left
                        }
                      })
                    }.(pair))
                  }).(->(left) {
                    ->(right) {
                      ->(f) {
                        f.(left).(right)
                      }
                    }
                  }.(->(f) {
                    ->(v) {
                      v
                    }
                  }).(->(f) {
                    ->(v) {
                      v
                    }
                  })))
                }).(a)
              }
            }.(a).(b)).(b).(x)
          })
        }
      }
    }).(n).(->(f) {
      ->(v) {
        f.(f.(f.(f.(f.(v)))))
      }
    })).(->(item) {
      ->(lst) {
        ->(left) {
          ->(right) {
            ->(f) {
              f.(left).(right)
            }
          }
        }.(->(a) {
          ->(b) {
            b
          }
        }).(->(left) {
          ->(right) {
            ->(f) {
              f.(left).(right)
            }
          }
        }.(item).(lst))
      }
    }.(->(f) {
      ->(v) {
        f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(v))))))))))
      }
    }).(->(item) {
      ->(lst) {
        ->(left) {
          ->(right) {
            ->(f) {
              f.(left).(right)
            }
          }
        }.(->(a) {
          ->(b) {
            b
          }
        }).(->(left) {
          ->(right) {
            ->(f) {
              f.(left).(right)
            }
          }
        }.(item).(lst))
      }
    }.(->(n) {
      ->(f) {
        ->(v) {
          f.(n.(f).(v))
        }
      }
    }.(->(n) {
      ->(f) {
        ->(v) {
          f.(n.(f).(v))
        }
      }
    }.(->(n) {
      ->(f) {
        ->(v) {
          f.(n.(f).(v))
        }
      }
    }.(->(f) {
      ->(v) {
        f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(v))))))))))
      }
    })))).(->(item) {
      ->(lst) {
        ->(left) {
          ->(right) {
            ->(f) {
              f.(left).(right)
            }
          }
        }.(->(a) {
          ->(b) {
            b
          }
        }).(->(left) {
          ->(right) {
            ->(f) {
              f.(left).(right)
            }
          }
        }.(item).(lst))
      }
    }.(->(n) {
      ->(f) {
        ->(v) {
          f.(n.(f).(v))
        }
      }
    }.(->(n) {
      ->(f) {
        ->(v) {
          f.(n.(f).(v))
        }
      }
    }.(->(n) {
      ->(f) {
        ->(v) {
          f.(n.(f).(v))
        }
      }
    }.(->(n) {
      ->(f) {
        ->(v) {
          f.(n.(f).(v))
        }
      }
    }.(->(f) {
      ->(v) {
        f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(v))))))))))
      }
    }))))).(->(item) {
      ->(lst) {
        ->(left) {
          ->(right) {
            ->(f) {
              f.(left).(right)
            }
          }
        }.(->(a) {
          ->(b) {
            b
          }
        }).(->(left) {
          ->(right) {
            ->(f) {
              f.(left).(right)
            }
          }
        }.(item).(lst))
      }
    }.(->(n) {
      ->(f) {
        ->(v) {
          f.(n.(f).(v))
        }
      }
    }.(->(n) {
      ->(f) {
        ->(v) {
          f.(n.(f).(v))
        }
      }
    }.(->(n) {
      ->(f) {
        ->(v) {
          f.(n.(f).(v))
        }
      }
    }.(->(n) {
      ->(f) {
        ->(v) {
          f.(n.(f).(v))
        }
      }
    }.(->(f) {
      ->(v) {
        f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(v))))))))))
      }
    }))))).(->(left) {
      ->(right) {
        ->(f) {
          f.(left).(right)
        }
      }
    }.(->(a) {
      ->(b) {
        a
      }
    }).(->(a) {
      ->(b) {
        a
      }
    })))))).(->(f) {
      ->(g) {
        ->(n) {
          f.(g.(g)).(n)
        }
      }.(->(g) {
        ->(n) {
          f.(g.(g)).(n)
        }
      })
    }.(->(partial) {
      ->(result) {
        ->(n) {
          ->(a) {
            ->(b) {
              ->(bool) {
                bool.(->(a) {
                  ->(b) {
                    b
                  }
                }).(->(a) {
                  ->(b) {
                    a
                  }
                })
              }.(->(a) {
                ->(b) {
                  ->(n) {
                    n.(->(x) {
                      ->(a) {
                        ->(b) {
                          b
                        }
                      }
                    }).(->(a) {
                      ->(b) {
                        a
                      }
                    })
                  }.(->(a) {
                    ->(b) {
                      b.(->(n) {
                        ->(p) {
                          p.(->(left) {
                            ->(right) {
                              right
                            }
                          })
                        }.(n.(->(pair) {
                          ->(left) {
                            ->(right) {
                              ->(f) {
                                f.(left).(right)
                              }
                            }
                          }.(->(n) {
                            ->(f) {
                              ->(v) {
                                f.(n.(f).(v))
                              }
                            }
                          }.(->(p) {
                            p.(->(left) {
                              ->(right) {
                                left
                              }
                            })
                          }.(pair))).(->(p) {
                            p.(->(left) {
                              ->(right) {
                                left
                              }
                            })
                          }.(pair))
                        }).(->(left) {
                          ->(right) {
                            ->(f) {
                              f.(left).(right)
                            }
                          }
                        }.(->(f) {
                          ->(v) {
                            v
                          }
                        }).(->(f) {
                          ->(v) {
                            v
                          }
                        })))
                      }).(a)
                    }
                  }.(a).(b))
                }
              }.(b).(a))
            }
          }.(n).(->(f) {
            ->(v) {
              f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(v))))))))))
            }
          }).(->(item) {
            ->(lst) {
              ->(left) {
                ->(right) {
                  ->(f) {
                    f.(left).(right)
                  }
                }
              }.(->(a) {
                ->(b) {
                  b
                }
              }).(->(left) {
                ->(right) {
                  ->(f) {
                    f.(left).(right)
                  }
                }
              }.(item).(lst))
            }
          }.(n).(result)).(->(x) {
            partial.(->(item) {
              ->(lst) {
                ->(left) {
                  ->(right) {
                    ->(f) {
                      f.(left).(right)
                    }
                  }
                }.(->(a) {
                  ->(b) {
                    b
                  }
                }).(->(left) {
                  ->(right) {
                    ->(f) {
                      f.(left).(right)
                    }
                  }
                }.(item).(lst))
              }
            }.(->(f) {
              ->(g) {
                ->(n) {
                  f.(g.(g)).(n)
                }
              }.(->(g) {
                ->(n) {
                  f.(g.(g)).(n)
                }
              })
            }.(->(partial) {
              ->(a) {
                ->(b) {
                  ->(a) {
                    ->(b) {
                      ->(bool) {
                        bool.(->(a) {
                          ->(b) {
                            b
                          }
                        }).(->(a) {
                          ->(b) {
                            a
                          }
                        })
                      }.(->(a) {
                        ->(b) {
                          ->(n) {
                            n.(->(x) {
                              ->(a) {
                                ->(b) {
                                  b
                                }
                              }
                            }).(->(a) {
                              ->(b) {
                                a
                              }
                            })
                          }.(->(a) {
                            ->(b) {
                              b.(->(n) {
                                ->(p) {
                                  p.(->(left) {
                                    ->(right) {
                                      right
                                    }
                                  })
                                }.(n.(->(pair) {
                                  ->(left) {
                                    ->(right) {
                                      ->(f) {
                                        f.(left).(right)
                                      }
                                    }
                                  }.(->(n) {
                                    ->(f) {
                                      ->(v) {
                                        f.(n.(f).(v))
                                      }
                                    }
                                  }.(->(p) {
                                    p.(->(left) {
                                      ->(right) {
                                        left
                                      }
                                    })
                                  }.(pair))).(->(p) {
                                    p.(->(left) {
                                      ->(right) {
                                        left
                                      }
                                    })
                                  }.(pair))
                                }).(->(left) {
                                  ->(right) {
                                    ->(f) {
                                      f.(left).(right)
                                    }
                                  }
                                }.(->(f) {
                                  ->(v) {
                                    v
                                  }
                                }).(->(f) {
                                  ->(v) {
                                    v
                                  }
                                })))
                              }).(a)
                            }
                          }.(a).(b))
                        }
                      }.(b).(a))
                    }
                  }.(a).(b).(a).(->(x) {
                    partial.(->(a) {
                      ->(b) {
                        b.(->(n) {
                          ->(p) {
                            p.(->(left) {
                              ->(right) {
                                right
                              }
                            })
                          }.(n.(->(pair) {
                            ->(left) {
                              ->(right) {
                                ->(f) {
                                  f.(left).(right)
                                }
                              }
                            }.(->(n) {
                              ->(f) {
                                ->(v) {
                                  f.(n.(f).(v))
                                }
                              }
                            }.(->(p) {
                              p.(->(left) {
                                ->(right) {
                                  left
                                }
                              })
                            }.(pair))).(->(p) {
                              p.(->(left) {
                                ->(right) {
                                  left
                                }
                              })
                            }.(pair))
                          }).(->(left) {
                            ->(right) {
                              ->(f) {
                                f.(left).(right)
                              }
                            }
                          }.(->(f) {
                            ->(v) {
                              v
                            }
                          }).(->(f) {
                            ->(v) {
                              v
                            }
                          })))
                        }).(a)
                      }
                    }.(a).(b)).(b).(x)
                  })
                }
              }
            }).(n).(->(f) {
              ->(v) {
                f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(v))))))))))
              }
            })).(result)).(->(f) {
              ->(g) {
                ->(n) {
                  f.(g.(g)).(n)
                }
              }.(->(g) {
                ->(n) {
                  f.(g.(g)).(n)
                }
              })
            }.(->(partial) {
              ->(num) {
                ->(denom) {
                  ->(a) {
                    ->(b) {
                      ->(bool) {
                        bool.(->(a) {
                          ->(b) {
                            b
                          }
                        }).(->(a) {
                          ->(b) {
                            a
                          }
                        })
                      }.(->(a) {
                        ->(b) {
                          ->(n) {
                            n.(->(x) {
                              ->(a) {
                                ->(b) {
                                  b
                                }
                              }
                            }).(->(a) {
                              ->(b) {
                                a
                              }
                            })
                          }.(->(a) {
                            ->(b) {
                              b.(->(n) {
                                ->(p) {
                                  p.(->(left) {
                                    ->(right) {
                                      right
                                    }
                                  })
                                }.(n.(->(pair) {
                                  ->(left) {
                                    ->(right) {
                                      ->(f) {
                                        f.(left).(right)
                                      }
                                    }
                                  }.(->(n) {
                                    ->(f) {
                                      ->(v) {
                                        f.(n.(f).(v))
                                      }
                                    }
                                  }.(->(p) {
                                    p.(->(left) {
                                      ->(right) {
                                        left
                                      }
                                    })
                                  }.(pair))).(->(p) {
                                    p.(->(left) {
                                      ->(right) {
                                        left
                                      }
                                    })
                                  }.(pair))
                                }).(->(left) {
                                  ->(right) {
                                    ->(f) {
                                      f.(left).(right)
                                    }
                                  }
                                }.(->(f) {
                                  ->(v) {
                                    v
                                  }
                                }).(->(f) {
                                  ->(v) {
                                    v
                                  }
                                })))
                              }).(a)
                            }
                          }.(a).(b))
                        }
                      }.(b).(a))
                    }
                  }.(num).(denom).(->(f) {
                    ->(v) {
                      v
                    }
                  }).(->(x) {
                    ->(n) {
                      ->(f) {
                        ->(v) {
                          f.(n.(f).(v))
                        }
                      }
                    }.(partial.(->(a) {
                      ->(b) {
                        b.(->(n) {
                          ->(p) {
                            p.(->(left) {
                              ->(right) {
                                right
                              }
                            })
                          }.(n.(->(pair) {
                            ->(left) {
                              ->(right) {
                                ->(f) {
                                  f.(left).(right)
                                }
                              }
                            }.(->(n) {
                              ->(f) {
                                ->(v) {
                                  f.(n.(f).(v))
                                }
                              }
                            }.(->(p) {
                              p.(->(left) {
                                ->(right) {
                                  left
                                }
                              })
                            }.(pair))).(->(p) {
                              p.(->(left) {
                                ->(right) {
                                  left
                                }
                              })
                            }.(pair))
                          }).(->(left) {
                            ->(right) {
                              ->(f) {
                                f.(left).(right)
                              }
                            }
                          }.(->(f) {
                            ->(v) {
                              v
                            }
                          }).(->(f) {
                            ->(v) {
                              v
                            }
                          })))
                        }).(a)
                      }
                    }.(num).(denom)).(denom)).(x)
                  })
                }
              }
            }).(n).(->(f) {
              ->(v) {
                f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(v))))))))))
              }
            })).(x)
          })
        }
      }
    }).(->(left) {
      ->(right) {
        ->(f) {
          f.(left).(right)
        }
      }
    }.(->(a) {
      ->(b) {
        a
      }
    }).(->(a) {
      ->(b) {
        a
      }
    })).(n))))
  })
}.(->(f) {
  ->(v) {
    f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(v))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  }
})
)
