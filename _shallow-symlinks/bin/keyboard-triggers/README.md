Scripts intended to be triggered by keyboard shortcuts, e.g. via KMonad :)

Scripts are split in 2 categories:

- **Platform-independent**: Commands that are platform independent.

- **Platform-specific**: This are based on tools or commands that are specific for each OS. In this
  case, the script implementation is placed in the corresponding OS directory and the execution is
  dynamically dispatched to its corresponding counterpart based on the running OS.

