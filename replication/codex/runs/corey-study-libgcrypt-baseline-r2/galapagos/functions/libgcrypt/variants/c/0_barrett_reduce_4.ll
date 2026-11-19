; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libgcrypt-baseline-r2/functions/libgcrypt/variants/c/0_barrett_reduce_4.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libgcrypt-baseline-r2/functions/libgcrypt/variants/c/0_barrett_reduce_4.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local signext i16 @barrett_reduce(i16 noundef signext %a) #0 {
entry:
  %a.addr = alloca i16, align 2
  %q = alloca i32, align 4
  %r = alloca i32, align 4
  store i16 %a, ptr %a.addr, align 2
  %0 = load i16, ptr %a.addr, align 2
  %conv = sext i16 %0 to i32
  %div = sdiv i32 %conv, 3329
  store i32 %div, ptr %q, align 4
  %1 = load i16, ptr %a.addr, align 2
  %conv1 = sext i16 %1 to i32
  %2 = load i32, ptr %q, align 4
  %mul = mul nsw i32 %2, 3329
  %sub = sub nsw i32 %conv1, %mul
  store i32 %sub, ptr %r, align 4
  %3 = load i32, ptr %r, align 4
  %cmp = icmp sgt i32 %3, 1664
  %conv2 = zext i1 %cmp to i32
  %mul3 = mul nsw i32 %conv2, 3329
  %4 = load i32, ptr %r, align 4
  %sub4 = sub nsw i32 %4, %mul3
  store i32 %sub4, ptr %r, align 4
  %5 = load i32, ptr %r, align 4
  %cmp5 = icmp slt i32 %5, -1664
  %conv6 = zext i1 %cmp5 to i32
  %mul7 = mul nsw i32 %conv6, 3329
  %6 = load i32, ptr %r, align 4
  %add = add nsw i32 %6, %mul7
  store i32 %add, ptr %r, align 4
  %7 = load i32, ptr %r, align 4
  %conv8 = trunc i32 %7 to i16
  ret i16 %conv8
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call signext i16 @barrett_reduce(i16 noundef signext 0)
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
