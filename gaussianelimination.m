%function gaussianelimination(A, b)
A = [4,1;2,3];
b = [-1;3];

  % Check for illegal inputs.
  if (size(A,1)~=size(b,1))
    fprintf('# of rows of matrix A is NOT equal to the # of rows of b!\n');
    return;
  end
  if (size(b,2)~=1)
    fprintf('b is not a column vector!\n');
    return;
  end
  if (size(A,1)~=size(A,2))
    fprintf('A is not a square matrix!\n');
    return;
  end

  % Define the augemented matrix.
  fprintf('Initial augmented matrix');
  T = [A, b]

  % set the # of rows.
  n = size(T,1);

  % Gaussian elimination
  for i=1:(n-1)
    % find p which is the smallest number between i and n such that
    % T(p,i) is not equal to 0
    p = i;
    while (T(p,i)==0)
      p = p+1;
    end
    % if p>n, then A is singular, stop the program
    if (p>n)
      fprintf('Matrix A is singular!'\n);
      return;
    end
    % if p is not equal to i, we need to switch row i and row p.
    temp = T(p,:);
    T(p,:) = T(i,:);
    T(i,:) = temp;
    % Elimination
    for j=(i+1):n
      m = T(j,i)/T(i,i);
      T(j,:) = T(j,:)-m*T(i,:);
    end

    % Print out the new augmented matrix
    fprintf('After %d steps of Gaussian elimination:',i);
    T
  end

  % If T(n,n)=0, then matrix A is singular. Stop the program.
  if (T(n,n)==0)
    fprintf('Matrix A is singular!'\n);
    return;
  end

  % Now, T should be a row echelon form. We can do the backward substitution.
  x = zeros(n,1);
  x(n) = T(n,n+1)/T(n,n);
  for i=(n-1):-1:1
    x(i) = ( T(i,n+1)-T(i,(i+1):n)*x((i+1):n) )/T(i,i);
  end
  % print out the solution
  fprintf('The solution is');
  x