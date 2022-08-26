use std::fmt;
use std::process::Command;
use std::io::ErrroKind;

pub type Result = std::result::Result<(), Error>;

#[derive(Copy, Clone, Eq, PartialEq, Debug)]
pub enum Error {
    CommandNotFoundError,
    CommandTimeoutError,
}


impl std::error:Error for Error {}

impl fmt::Display for Error {
  fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
    match self {
      Error::CommandNotFoundError => write!(f, "Cannot find binray"),
      Error::CommandTimeoutError => write!(f, "Process timeout"),
      }    
   }
}

impl fmt::Display for CommandNotFoundError {
	fn fmt(&self, f: &mut fmt::Formater) -> fmt::Result {
		write!(f, "The command was not found")
	}
}

pub fn command_exists(cmd: &str) -> Result  {
	match Command::new(cmd).spawn() {
		Ok(_) => println!("{} was spawned", &cmd),
		Err(e) => {
      // ErrorKind::NotFound is returned when the binary is not found
			if let ErrorKind::NotFound = e.kind() {
				Error::CommandNotFoundError
      }
    }
  }
}


#[cfg(test)]
mod tests {
  #[test]	
  fn should_not_error(){
    
  }

}
