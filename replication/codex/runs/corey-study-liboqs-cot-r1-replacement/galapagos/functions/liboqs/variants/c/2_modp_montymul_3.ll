; ModuleID = '/home/cbhei/galapagos-corey-runs/corey-study-liboqs-cot-r1-replacement/functions/liboqs/variants/c/2_modp_montymul_3.bc'
source_filename = "/home/cbhei/galapagos-corey-runs/corey-study-liboqs-cot-r1-replacement/functions/liboqs/variants/c/2_modp_montymul_3.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @modp_montymul(i32 noundef %a, i32 noundef %b, i32 noundef %p, i32 noundef %p0i) #0 {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %p.addr = alloca i32, align 4
  %p0i.addr = alloca i32, align 4
  %lo = alloca i64, align 8
  %hi = alloca i64, align 8
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
  %1 = load i32, ptr %b.addr, align 4
  %conv1 = zext i32 %1 to i64
  %mul = mul i64 %conv, %conv1
  store i64 %mul, ptr %lo, align 8
  %2 = load i32, ptr %a.addr, align 4
  %shr = lshr i32 %2, 16
  %conv2 = zext i32 %shr to i64
  %3 = load i32, ptr %b.addr, align 4
  %conv3 = zext i32 %3 to i64
  %mul4 = mul i64 %conv2, %conv3
  store i64 %mul4, ptr %hi, align 8
  %4 = load i64, ptr %lo, align 8
  %5 = load i64, ptr %hi, align 8
  %shl = shl i64 %5, 16
  %add = add i64 %4, %shl
  store i64 %add, ptr %z, align 8
  %6 = load i64, ptr %z, align 8
  %7 = load i32, ptr %p0i.addr, align 4
  %conv5 = zext i32 %7 to i64
  %mul6 = mul i64 %6, %conv5
  %and7 = and i64 %mul6, 2147483647
  %8 = load i32, ptr %p.addr, align 4
  %conv8 = zext i32 %8 to i64
  %mul9 = mul i64 %and7, %conv8
  store i64 %mul9, ptr %w, align 8
  %9 = load i64, ptr %z, align 8
  %10 = load i64, ptr %w, align 8
  %add10 = add i64 %9, %10
  %shr11 = lshr i64 %add10, 31
  %conv12 = trunc i64 %shr11 to i32
  %11 = load i32, ptr %p.addr, align 4
  %sub = sub i32 %conv12, %11
  store i32 %sub, ptr %d, align 4
  %12 = load i32, ptr %p.addr, align 4
  %13 = load i32, ptr %d, align 4
  %shr13 = lshr i32 %13, 31
  %sub14 = sub i32 0, %shr13
  %and15 = and i32 %12, %sub14
  %14 = load i32, ptr %d, align 4
  %add16 = add i32 %14, %and15
  store i32 %add16, ptr %d, align 4
  %15 = load i32, ptr %d, align 4
  ret i32 %15
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
