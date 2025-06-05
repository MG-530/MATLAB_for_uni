
# 📊 MATLAB Project – Math Software (1404-2)

> 📘 **Course**: Math Software  
> 🏛️ **University**: University of Guilan  
> 👩‍🏫 **Instructor**: Nasim Madah Shariati  
> 🧑‍🎓 **Semester**: 1404-2  
> 💻 **Language**: MATLAB  

---

## 📄 Project Description

This repository contains MATLAB solutions to the final project for the **Math Software** course. The problems involve root-finding methods, matrix analysis, curve fitting, and 3D plotting using MATLAB.  

Each problem is described in the [📕 question file](./Proj.pdf), and answers are provided in individual `.m` files. Additionally, a [📘 Self-Study Book](./SelfStudyBook.pdf) is included to help with independent learning.

---

## 📌 Project Questions

1. **Bisection Method**  
   Solve: `cos(2x) + 6 = x`  
   - Find root to five correct decimal places  
   - Compare with `fzero`  
   - Include graph  

2. **Newton’s Method**  
   Solve: `ln(x) + x^2 = 3`  
   - Approximate root to five correct decimal places  
   - Compare with `fzero`  
   - Include graph  

3. **Hilbert Matrix Analysis**  
   - Define `H` as an `n x n` Hilbert matrix: `H(i,j) = 1 / (i + j - 1)`  
   - Solve `Hx = b`, where `b = ones(n,1)` and `n = 5`  
   - Calculate:
     - Characteristic polynomial  
     - Eigenvalues  
     - Eigenvectors  

4. **Polynomial Curve Fitting**  
   - Use Japan's 2003 monthly oil consumption data  
   - Fit polynomials of degree 1 through 10  
   - Plot in a 2×5 subplot layout  
   - Calculate RMSE for each fit  

5. **3D Surface & Contour Plot**  
   - Plot `f(x, y) = cos(x) * cos(y) * exp(-sqrt(x² + y²)/4)`  
   - Plot over the domain: `−2π ≤ x, y ≤ 2π`  
   - Include contours

---

## 🗂️ Repository Structure

```

📦 MathSoftware-Project-Guilan-14042
├── Proj.pdf                    # 📕 Project questions
├── SelfStudyBook.pdf        # 📘 Study resource
├── answers/
│   ├── Q1_Bisection_vs_fzero.m
│   ├── Q2_Newton_vs_fzero.m
│   ├── Q3_HilbertMatrix.m
│   ├── Q4_OilFit_RMSE.m
│   └── Q5_SurfaceAndContours.m
└── README.md                   # 📄 This file

```

---

## ▶️ How to Run

1. Open MATLAB.
2. Clone or download this repository.
3. Navigate to the `answers/` folder.
4. Run the script for each question.
5. View plots in MATLAB’s figure window.

---

## 📌 Requirements

- MATLAB R2022a or later recommended  
- Symbolic Math Toolbox (for eigenvalues, polynomials)  
- Curve Fitting Toolbox (for Q4)

---

## 📚 License

This repository is made available for **academic and personal use**.  
Please credit appropriately if you reuse content.

---

> 💬 _"Pure mathematics is, in its way, the poetry of logical ideas."_  
> — Albert Einstein
```

---

