; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-liboqs-baseline-r3/functions/liboqs/variants/c/2_modp_montymul_5.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-liboqs-baseline-r3/functions/liboqs/variants/c/2_modp_montymul_5.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @modp_montymul(i32 noundef %a, i32 noundef %b, i32 noundef %p, i32 noundef %p0i) #0 {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %p.addr = alloca i32, align 4
  %p0i.addr = alloca i32, align 4
  %z = alloca i64, align 8
  %low = alloca i64, align 8
  %inverse = alloca i64, align 8
  %m = alloca i64, align 8
  %d = alloca i32, align 4
  store i32 %a, ptr %a.addr, align 4
  store i32 %b, ptr %b.addr, align 4
  store i32 %p, ptr %p.addr, align 4
  store i32 %p0i, ptr %p0i.addr, align 4
  %0 = load i32, ptr %a.addr, align 4
  %conv = zext i32 %0 to i64
  %1 = load i32, ptr %b.addr, align 4
  %conv1 = zext i32 %1 to i64
  %mul = mul i64 %conv, %conv1
  store i64 %mul, ptr %z, align 8
  %2 = load i64, ptr %z, align 8
  %and = and i64 %2, 2147483647
  store i64 %and, ptr %low, align 8
  %3 = load i32, ptr %p0i.addr, align 4
  %conv2 = zext i32 %3 to i64
  %and3 = and i64 %conv2, 2147483647
  store i64 %and3, ptr %inverse, align 8
  %4 = load i64, ptr %low, align 8
  %5 = load i64, ptr %inverse, align 8
  %mul4 = mul i64 %4, %5
  %and5 = and i64 %mul4, 2147483647
  store i64 %and5, ptr %m, align 8
  %6 = load i64, ptr %z, align 8
  %7 = load i64, ptr %m, align 8
  %8 = load i32, ptr %p.addr, align 4
  %conv6 = zext i32 %8 to i64
  %mul7 = mul i64 %7, %conv6
  %add = add i64 %6, %mul7
  %shr = lshr i64 %add, 31
  %conv8 = trunc i64 %shr to i32
  %9 = load i32, ptr %p.addr, align 4
  %sub = sub i32 %conv8, %9
  store i32 %sub, ptr %d, align 4
  %10 = load i32, ptr %d, align 4
  %11 = load i32, ptr %p.addr, align 4
  %12 = load i32, ptr %d, align 4
  %shr9 = lshr i32 %12, 31
  %sub10 = sub i32 0, %shr9
  %and11 = and i32 %11, %sub10
  %add12 = add i32 %10, %and11
  ret i32 %add12
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
