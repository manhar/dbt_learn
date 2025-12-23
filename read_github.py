import requests
import base64

def get_github_files(repo_owner, repo_name, directory, token):
    url = f"https://api.github.com/repos/{repo_owner}/{repo_name}/contents/{directory}"
    headers = {
        "Authorization": f"token {token}"
    }
    response = requests.get(url, headers=headers)
    response.raise_for_status()
    return response.json()

def print_sql_files_content(files, token):
    for file in files:
        if file['type'] == 'file' and file['name'].endswith('.sql'):
            file_url = file['download_url']
            file_response = requests.get(file_url, headers={"Authorization": f"token {token}"})
            file_response.raise_for_status()
            print(f"Content of {file['name']}:\n")
            print(file_response.text)
            print("\n" + "="*80 + "\n")
        elif file['type'] == 'dir':
            sub_files = get_github_files(repo_owner, repo_name, file['path'], token)
            print_sql_files_content(sub_files, token)

if __name__ == "__main__":
    repo_owner = "your-repo-owner"
    repo_name = "your-repo-name"
    directory = "your-directory"
    token = "your-github-token"

    files = get_github_files(repo_owner, repo_name, directory, token)
    print_sql_files_content(files, token)