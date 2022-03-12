def greet(name: str) -> str:
    """Greet the user!

    Args:
        name: The name of the user.

    Returns:
        greeting: A greeting message for the user.
        
    """
    return f"Hello {name}!"

if __name__ == "__main__":
    print(greet("Jacob"))