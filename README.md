## Project Overview

This project was created to demonstrate a critical scenario in Git-based team development: **Diverged History** caused by simultaneous, independent updates pushed by multiple developers.

The objective was to inspect the repository status, diagnose the divergence, and propose/execute a solution path to reconcile the conflicting histories.

---

**Question:** A feature branch seems to have diverged after conflicting updates were pushed by multiple developers. The repository may contain unmerged work. A current status inspection is needed to help the team decide how to handle the merge situation.

---

## 📈 Scenario Timeline & Steps

The divergence was created by simulating two developers working independently from the same base commit.

### 1. Initial Setup

A base commit was established on the `master` branch.

### 2. Developer A's Work

A new branch, `feature/diverge`, was created. Developer A committed two separate changes, moving the feature branch ahead of `master`.

### 3. Developer B's Work (The Divergence Point)

Developer B committed an urgent fix directly to the `master` branch, pushing the two histories apart.

### 4. Inspection and Diagnosis

The **diverged state** was confirmed using the visual log command:

>> cmd to visualize the diverged state
git log --all --graph --oneline --decorate
