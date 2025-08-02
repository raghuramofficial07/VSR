
<!-- GitHub Project Banner -->
<p align="center">
  <img src="https://github.com/user-attachments/assets/501c98ee-809c-4376-b32d-6d38ae07c489" alt="Project Banner" width="100%">
</p>

<p align="center">
  <img src="https://img.shields.io/badge/GPA%20Target%20Calculator-black?logo=apple&logoColor=white&labelColor=black&color=black">
  <img src="https://img.shields.io/badge/Architecture-MVC-black?labelColor=black&color=black">
  <img src="https://img.shields.io/badge/Orientation-Portrait%20Only-black?labelColor=black&color=black">
  <img src="https://img.shields.io/badge/Built%20By-RaghuRam-black?labelColor=black&color=black">
</p>

# » GPA Target Calculator

![AppInfo SS 1](https://github.com/user-attachments/assets/27838cbf-3298-4a4e-aca8-d6907e75e4de)

A precise and lightweight iOS app to help students calculate the GPA they need in remaining semesters to achieve a desired final CGPA. Built using Swift and UIKit, this app simplifies academic goal-tracking with a focused user experience.

---

## » App Purpose

- Offers clarity for students who wish to track and plan their academic progress.
- Computes required GPA based on user’s current CGPA, desired CGPA, and remaining semesters.
- Encourages realistic target setting with motivational feedback.

---

## » App Architecture

- Built using **Model-View-Controller (MVC)** pattern:
  - `Model`: GPA calculation logic.
  - `View`: UIKit storyboard layout with locked portrait design.
  - `Controller`: Input validation, data flow, and UI updates.

---

## » Orientation Design

- App is locked to **portrait orientation**, ensuring a clean, focused UI flow and consistent layout across all devices.
- No distractions or rotation handling — designed purely for clarity and vertical flow.

---

## » User Inputs

![Launch Picture  1](https://github.com/user-attachments/assets/31a0395b-1315-4125-bcc7-145eb6bbf368)


- `Current CGPA` — the average GPA so far.
- `Target CGPA` — the final CGPA the student wants to achieve.
- `Remaining Semesters` — number of semesters left (out of 8).

---

## » Formula Used

Let:

- `T = 8` → total semesters (fixed)  
- `R = remaining semesters (user input)`  
- `C = completed semesters = T - R`  
- `CG_current = Current CGPA`  
- `CG_target = Target CGPA`

```
GPA_required = ((CG_target * T) - (CG_current * C)) / R
```

---

## » Tags

<p align="left">
  <img src="https://img.shields.io/badge/%23iOSDevelopment-black?logo=apple&labelColor=black&color=black">
  <img src="https://img.shields.io/badge/%23StudentTools-black?logo=apple&labelColor=black&color=black">
  <img src="https://img.shields.io/badge/%23AcademicPlanner-black?logo=notion&labelColor=black&color=black">
  <img src="https://img.shields.io/badge/%23BeyondCertifications-black?logo=tag&labelColor=black&color=black">
  <img src="https://img.shields.io/badge/%23IndustryOriented-black?logo=tag&labelColor=black&color=black">
  <img src="https://img.shields.io/badge/%23CodeWithRaghuRam-black?logo=tag&labelColor=black&color=black">
</p>

---

## » Author Footer

**Created By:** Vemparala Sri Satya RaghuRam  
**Platform:** Swift (iOS UIKit)  
