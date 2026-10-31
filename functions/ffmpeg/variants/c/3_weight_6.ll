; ModuleID = '/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/3_weight_6.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/3_weight_6.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @weight(i32 noundef 0, i32 noundef 0, i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @weight(i32 noundef %i, i32 noundef %blen, i32 noundef %offset) #0 {
entry:
  %retval = alloca i32, align 4
  %i.addr = alloca i32, align 4
  %blen.addr = alloca i32, align 4
  %offset.addr = alloca i32, align 4
  %d = alloca i32, align 4
  %num = alloca i32, align 4
  %den = alloca i32, align 4
  store i32 %i, ptr %i.addr, align 4
  store i32 %blen, ptr %blen.addr, align 4
  store i32 %offset, ptr %offset.addr, align 4
  %0 = load i32, ptr %i.addr, align 4
  %1 = load i32, ptr %offset.addr, align 4
  %mul = mul nsw i32 2, %1
  %cmp = icmp slt i32 %0, %mul
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %left

if.end:                                           ; preds = %entry
  %2 = load i32, ptr %i.addr, align 4
  %3 = load i32, ptr %blen.addr, align 4
  %sub = sub nsw i32 %3, 1
  %4 = load i32, ptr %offset.addr, align 4
  %mul1 = mul nsw i32 2, %4
  %sub2 = sub nsw i32 %sub, %mul1
  %cmp3 = icmp sgt i32 %2, %sub2
  br i1 %cmp3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  br label %right

if.end5:                                          ; preds = %if.end
  store i32 8, ptr %retval, align 4
  br label %return

left:                                             ; preds = %if.then
  %5 = load i32, ptr %i.addr, align 4
  store i32 %5, ptr %d, align 4
  br label %compute

right:                                            ; preds = %if.then4
  %6 = load i32, ptr %blen.addr, align 4
  %sub6 = sub nsw i32 %6, 1
  %7 = load i32, ptr %i.addr, align 4
  %sub7 = sub nsw i32 %sub6, %7
  store i32 %sub7, ptr %d, align 4
  br label %compute

compute:                                          ; preds = %right, %left
  %8 = load i32, ptr %offset.addr, align 4
  %cmp8 = icmp eq i32 %8, 1
  br i1 %cmp8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %compute
  %9 = load i32, ptr %d, align 4
  %tobool = icmp ne i32 %9, 0
  %10 = zext i1 %tobool to i64
  %cond = select i1 %tobool, i32 5, i32 3
  store i32 %cond, ptr %retval, align 4
  br label %return

if.end10:                                         ; preds = %compute
  %11 = load i32, ptr %d, align 4
  %mul11 = mul nsw i32 6, %11
  %12 = load i32, ptr %offset.addr, align 4
  %add = add nsw i32 %mul11, %12
  %sub12 = sub nsw i32 %add, 1
  store i32 %sub12, ptr %num, align 4
  %13 = load i32, ptr %offset.addr, align 4
  %mul13 = mul nsw i32 2, %13
  %sub14 = sub nsw i32 %mul13, 1
  store i32 %sub14, ptr %den, align 4
  %14 = load i32, ptr %num, align 4
  %15 = load i32, ptr %den, align 4
  %div = sdiv i32 %14, %15
  %add15 = add nsw i32 1, %div
  store i32 %add15, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end10, %if.then9, %if.end5
  %16 = load i32, ptr %retval, align 4
  ret i32 %16
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
