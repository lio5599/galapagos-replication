; ModuleID = '/home/liolsen/galapagos-replication/functions/libgcrypt/variants/c/0_barrett_reduce_9.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libgcrypt/variants/c/0_barrett_reduce_9.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local signext i16 @barrett_reduce(i16 noundef signext %a) #0 {
entry:
  %a.addr = alloca i16, align 2
  %product = alloca i64, align 8
  %quotient = alloca i64, align 8
  %result = alloca i64, align 8
  store i16 %a, ptr %a.addr, align 2
  %0 = load i16, ptr %a.addr, align 2
  %conv = sext i16 %0 to i64
  %mul = mul nsw i64 %conv, 20159
  store i64 %mul, ptr %product, align 8
  %1 = load i64, ptr %product, align 8
  %add = add nsw i64 %1, 33554432
  %shr = ashr i64 %add, 26
  store i64 %shr, ptr %quotient, align 8
  %2 = load i16, ptr %a.addr, align 2
  %conv1 = sext i16 %2 to i64
  %3 = load i64, ptr %quotient, align 8
  %mul2 = mul nsw i64 %3, 3329
  %sub = sub nsw i64 %conv1, %mul2
  store i64 %sub, ptr %result, align 8
  %4 = load i64, ptr %result, align 8
  %conv3 = trunc i64 %4 to i16
  ret i16 %conv3
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
