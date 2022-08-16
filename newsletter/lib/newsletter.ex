defmodule Newsletter do
  def read_emails(path) do
    File.stream!(path) |> Enum.to_list() |> Enum.map(fn email -> String.trim(email) end)
  end

  def open_log(path) do
    File.open!(path, [:write])
  end

  def log_sent_email(pid, email) do
    IO.write(pid, "#{email}\n")
  end

  def close_log(pid) do
    File.close(pid)
  end

  def send_newsletter(emails_path, log_path, send_fun) do
    pid = open_log(log_path)

    read_emails(emails_path)
    |> Enum.each(fn email ->
      if send_fun.(email) == :ok do
        log_sent_email(pid, email)
      end
    end)

    close_log(pid)
  end
end
