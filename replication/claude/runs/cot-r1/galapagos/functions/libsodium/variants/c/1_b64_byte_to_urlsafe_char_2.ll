; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_2.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_byte_to_urlsafe_char(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_byte_to_urlsafe_char(i32 noundef %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  %c = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %add = add nsw i32 %0, 65
  store i32 %add, ptr %c, align 4
  %1 = load i32, ptr %x.addr, align 4
  %cmp = icmp ugt i32 %1, 25
  %conv = zext i1 %cmp to i32
  %mul = mul nsw i32 %conv, 6
  %2 = load i32, ptr %c, align 4
  %add1 = add nsw i32 %2, %mul
  store i32 %add1, ptr %c, align 4
  %3 = load i32, ptr %x.addr, align 4
  %cmp2 = icmp ugt i32 %3, 51
  %conv3 = zext i1 %cmp2 to i32
  %mul4 = mul nsw i32 %conv3, 75
  %4 = load i32, ptr %c, align 4
  %sub = sub nsw i32 %4, %mul4
  store i32 %sub, ptr %c, align 4
  %5 = load i32, ptr %x.addr, align 4
  %cmp5 = icmp ugt i32 %5, 61
  %conv6 = zext i1 %cmp5 to i32
  %mul7 = mul nsw i32 %conv6, 13
  %6 = load i32, ptr %c, align 4
  %sub8 = sub nsw i32 %6, %mul7
  store i32 %sub8, ptr %c, align 4
  %7 = load i32, ptr %x.addr, align 4
  %cmp9 = icmp ugt i32 %7, 62
  %conv10 = zext i1 %cmp9 to i32
  %mul11 = mul nsw i32 %conv10, 49
  %8 = load i32, ptr %c, align 4
  %add12 = add nsw i32 %8, %mul11
  store i32 %add12, ptr %c, align 4
  %9 = load i32, ptr %x.addr, align 4
  %cmp13 = icmp ult i32 %9, 64
  br i1 %cmp13, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %10 = load i32, ptr %c, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %10, %cond.true ], [ 0, %cond.false ]
  ret i32 %cond
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
