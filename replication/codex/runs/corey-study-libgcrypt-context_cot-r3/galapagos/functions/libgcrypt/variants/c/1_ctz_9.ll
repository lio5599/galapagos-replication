; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libgcrypt-context_cot-r3/functions/libgcrypt/variants/c/1_ctz_9.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libgcrypt-context_cot-r3/functions/libgcrypt/variants/c/1_ctz_9.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @ctz(i64 noundef %in) #0 {
entry:
  %retval = alloca i32, align 4
  %in.addr = alloca i64, align 8
  %bit = alloca i64, align 8
  %r = alloca i32, align 4
  store i64 %in, ptr %in.addr, align 8
  store i32 0, ptr %r, align 4
  %0 = load i64, ptr %in.addr, align 8
  %cmp = icmp eq i64 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 64, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i64, ptr %in.addr, align 8
  %2 = load i64, ptr %in.addr, align 8
  %sub = sub i64 0, %2
  %and = and i64 %1, %sub
  store i64 %and, ptr %bit, align 8
  %3 = load i64, ptr %bit, align 8
  %and1 = and i64 %3, -6148914691236517206
  %cmp2 = icmp ne i64 %and1, 0
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  %4 = load i32, ptr %r, align 4
  %add = add nsw i32 %4, 1
  store i32 %add, ptr %r, align 4
  br label %if.end4

if.end4:                                          ; preds = %if.then3, %if.end
  %5 = load i64, ptr %bit, align 8
  %and5 = and i64 %5, -3689348814741910324
  %cmp6 = icmp ne i64 %and5, 0
  br i1 %cmp6, label %if.then7, label %if.end9

if.then7:                                         ; preds = %if.end4
  %6 = load i32, ptr %r, align 4
  %add8 = add nsw i32 %6, 2
  store i32 %add8, ptr %r, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.then7, %if.end4
  %7 = load i64, ptr %bit, align 8
  %and10 = and i64 %7, -1085102592571150096
  %cmp11 = icmp ne i64 %and10, 0
  br i1 %cmp11, label %if.then12, label %if.end14

if.then12:                                        ; preds = %if.end9
  %8 = load i32, ptr %r, align 4
  %add13 = add nsw i32 %8, 4
  store i32 %add13, ptr %r, align 4
  br label %if.end14

if.end14:                                         ; preds = %if.then12, %if.end9
  %9 = load i64, ptr %bit, align 8
  %and15 = and i64 %9, -71777214294589696
  %cmp16 = icmp ne i64 %and15, 0
  br i1 %cmp16, label %if.then17, label %if.end19

if.then17:                                        ; preds = %if.end14
  %10 = load i32, ptr %r, align 4
  %add18 = add nsw i32 %10, 8
  store i32 %add18, ptr %r, align 4
  br label %if.end19

if.end19:                                         ; preds = %if.then17, %if.end14
  %11 = load i64, ptr %bit, align 8
  %and20 = and i64 %11, -281470681808896
  %cmp21 = icmp ne i64 %and20, 0
  br i1 %cmp21, label %if.then22, label %if.end24

if.then22:                                        ; preds = %if.end19
  %12 = load i32, ptr %r, align 4
  %add23 = add nsw i32 %12, 16
  store i32 %add23, ptr %r, align 4
  br label %if.end24

if.end24:                                         ; preds = %if.then22, %if.end19
  %13 = load i64, ptr %bit, align 8
  %and25 = and i64 %13, -4294967296
  %cmp26 = icmp ne i64 %and25, 0
  br i1 %cmp26, label %if.then27, label %if.end29

if.then27:                                        ; preds = %if.end24
  %14 = load i32, ptr %r, align 4
  %add28 = add nsw i32 %14, 32
  store i32 %add28, ptr %r, align 4
  br label %if.end29

if.end29:                                         ; preds = %if.then27, %if.end24
  %15 = load i32, ptr %r, align 4
  store i32 %15, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end29, %if.then
  %16 = load i32, ptr %retval, align 4
  ret i32 %16
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @ctz(i64 noundef 0)
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
