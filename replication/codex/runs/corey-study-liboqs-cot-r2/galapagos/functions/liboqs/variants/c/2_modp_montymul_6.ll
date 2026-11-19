; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-liboqs-cot-r2/functions/liboqs/variants/c/2_modp_montymul_6.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-liboqs-cot-r2/functions/liboqs/variants/c/2_modp_montymul_6.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @modp_montymul(i32 noundef %a, i32 noundef %b, i32 noundef %p, i32 noundef %p0i) #0 {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %p.addr = alloca i32, align 4
  %p0i.addr = alloca i32, align 4
  %a0 = alloca i64, align 8
  %a1 = alloca i64, align 8
  %b0 = alloca i64, align 8
  %b1 = alloca i64, align 8
  %z = alloca i64, align 8
  %w = alloca i64, align 8
  %d = alloca i32, align 4
  store i32 %a, ptr %a.addr, align 4
  store i32 %b, ptr %b.addr, align 4
  store i32 %p, ptr %p.addr, align 4
  store i32 %p0i, ptr %p0i.addr, align 4
  %0 = load i32, ptr %a.addr, align 4
  %and = and i32 %0, 65535
  %conv = zext i32 %and to i64
  store i64 %conv, ptr %a0, align 8
  %1 = load i32, ptr %a.addr, align 4
  %shr = lshr i32 %1, 16
  %conv1 = zext i32 %shr to i64
  store i64 %conv1, ptr %a1, align 8
  %2 = load i32, ptr %b.addr, align 4
  %and2 = and i32 %2, 65535
  %conv3 = zext i32 %and2 to i64
  store i64 %conv3, ptr %b0, align 8
  %3 = load i32, ptr %b.addr, align 4
  %shr4 = lshr i32 %3, 16
  %conv5 = zext i32 %shr4 to i64
  store i64 %conv5, ptr %b1, align 8
  %4 = load i64, ptr %a0, align 8
  %5 = load i64, ptr %b0, align 8
  %mul = mul i64 %4, %5
  %6 = load i64, ptr %a0, align 8
  %7 = load i64, ptr %b1, align 8
  %mul6 = mul i64 %6, %7
  %8 = load i64, ptr %a1, align 8
  %9 = load i64, ptr %b0, align 8
  %mul7 = mul i64 %8, %9
  %add = add i64 %mul6, %mul7
  %shl = shl i64 %add, 16
  %add8 = add i64 %mul, %shl
  %10 = load i64, ptr %a1, align 8
  %11 = load i64, ptr %b1, align 8
  %mul9 = mul i64 %10, %11
  %shl10 = shl i64 %mul9, 32
  %add11 = add i64 %add8, %shl10
  store i64 %add11, ptr %z, align 8
  %12 = load i64, ptr %z, align 8
  %13 = load i32, ptr %p0i.addr, align 4
  %conv12 = zext i32 %13 to i64
  %mul13 = mul i64 %12, %conv12
  %and14 = and i64 %mul13, 2147483647
  %14 = load i32, ptr %p.addr, align 4
  %conv15 = zext i32 %14 to i64
  %mul16 = mul i64 %and14, %conv15
  store i64 %mul16, ptr %w, align 8
  %15 = load i64, ptr %z, align 8
  %16 = load i64, ptr %w, align 8
  %add17 = add i64 %15, %16
  %shr18 = lshr i64 %add17, 31
  %conv19 = trunc i64 %shr18 to i32
  %17 = load i32, ptr %p.addr, align 4
  %sub = sub i32 %conv19, %17
  store i32 %sub, ptr %d, align 4
  %18 = load i32, ptr %p.addr, align 4
  %19 = load i32, ptr %d, align 4
  %shr20 = lshr i32 %19, 31
  %sub21 = sub i32 0, %shr20
  %and22 = and i32 %18, %sub21
  %20 = load i32, ptr %d, align 4
  %add23 = add i32 %20, %and22
  store i32 %add23, ptr %d, align 4
  %21 = load i32, ptr %d, align 4
  ret i32 %21
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @modp_montymul(i32 noundef 0, i32 noundef 0, i32 noundef 0, i32 noundef 0)
  ret i32 0
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.0 (git@github.com:llvm/llvm-project.git 1a7a00bdc99fa2b2ca19ecd2d1069991b3c1006b)"}
